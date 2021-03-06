class UsersController < ApplicationController
  def show
    # ユーザーの評価履歴を取得(問題ID、ユーザID)
    @scores = Score.includes(:division, :problem).where(problem_id: params['problem_id'], user_id: params['id'])

    # ユーザーの評価履歴が存在しない場合は、トップ画面に遷移
    redirect_to root_path and return if @scores.blank?

    # 回数の最大値を取得
    count_max = @scores.maximum(:count)
    # 合計値リスト(降順)[1回目と最新の5回分を取得]
    @sum_list = @scores.order(count: :desc).group(:count).having('count = 1 OR count > ?', count_max - 5).sum(:sum)

    # レーダーチャート用の情報リスト生成
    @scores_js = []
    # 順位付け結果の配列生成
    @radar_chart = []
    # 回数毎に繰り返し
    @sum_list.each do |sum|
      # 回数毎のレーダーチャート用に情報を整理（合計、区分、基準、最大値、タイトル）
      @scores_js += [@scores.where(count: sum[0]).to_json(only: [:sum],
                                                          include: { division: { only: [:division_id, :text, :standard, :max] }, problem: { only: [:title] } })]
      # 順位付けした情報を設定
      @radar_chart.push(radar_scores_set(@scores.where(count: sum[0])))
    end

    # 合計値リスト（昇順）[1回目と最新の5回分を取得]
    @sum_list = @scores.order(:count).group(:count).having('count = 1 OR count > ?', count_max - 5).sum(:sum)

    # 最大値取得
    @max = Division.where(problem_id: params['problem_id']).group(:problem_id).sum(:max)

    # 棒グラフ用のリスト生成
    @scores_bar = []
    # 比較用の変数
    @before_score = 0
    # 回数毎に繰り返し
    @sum_list.each do |sum|
      # 前回の結果との比較処理
      status = bar_status(@before_score, sum[1])
      # 回数毎に情報を設定（回数、合計、比較結果、最大値）
      bar_item = { count: sum[0], sum: sum[1], status: status, title: @scores[0].problem.title, max: @max.values[0] }
      # 情報を配列に格納
      @scores_bar.push(bar_item)
      # 比較用に合計値を格納
      @before_score = sum[1]
    end

    # 配列の順番を逆順に変更
    @scores_bar = @scores_bar.reverse
    # 合計値リストの変換
    @sum_list_js = @sum_list.to_json
    # binding.pry
  end

  private

  # 前回の合計値との比較
  # 0:等倍または初回
  # 1:プラス
  # -1:マイナス
  def bar_status(before, after)
    # 差分を取得
    num = after - before
    if num == 0 || before == 0
      0
    elsif num > 0
      1
    else
      -1
    end
  end

  # レーダーチャート用の順位付け処理
  def radar_scores_set(scores)
    # 戻り値の情報
    score = {}
    # 合計点数順に降順
    score_sort = scores.sort_by { |a| a[:sum] }.reverse
    # 上位の配列
    scores_up = []
    # 下位の配列
    scores_down = []
    # 合計点
    sum = 0
    # 同列確認用の変数
    score_point = 0
    # ソートした配列で繰り返す
    score_sort.each do |score|
      # 上位が２つ以下または、基準値と同列の場合
      if scores_up.length < 2 || score_point == score.sum
        # 上位に追加
        scores_up += [score]
        # 点数を更新
        score_point = score.sum
      else
        # 下位に追加
        scores_down += [score]
      end
      # 合計値にプラス
      sum += score.sum
    end

    # 戻り値に情報を設定（回数、上位、下位、合計値）
    score = { count: scores[0].count, up: scores_up, down: scores_down, sum: sum }
  end
end
