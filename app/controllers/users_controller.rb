class UsersController < ApplicationController
  def show
    # ユーザーの評価履歴を取得(問題ID、ユーザID)
    @scores = Score.includes(:division,:problem).where(problem_id: params['problem_id'], user_id: params['id'])
    # 合計値リスト(降順)
    @sum_list = @scores.order(count: :desc).group(:count).sum(:sum)


    # レーダーチャート用の情報リスト生成
    @scores_js = []
    # 棒グラフ用のリスト生成
    @scores_bar = []
    # 回数毎に繰り返し
    @sum_list.each do |sum|
      # 回数毎のレーダーチャート用に情報を整理（合計、区分、本文）
      @scores_js += [@scores.where(count: sum[0]).to_json(only: [:sum],
                                                          include: { division: { only: [:division_id, :text] } })]
    end

    # 合計値リスト（昇順）
    @sum_list = @scores.order(:count).group(:count).sum(:sum)

    # 比較用の変数
    @before_score = 0
    # 回数毎に繰り返し
    @sum_list.each do |sum|
      # 前回の結果との比較処理
      status = bar_status(@before_score ,sum[1])
      # 回数毎に情報を設定（回数、合計、比較結果）
      bar_item = {cont: sum[0],sum: sum[1],status: status}
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
  def bar_status(before,after)
    # 差分を取得
    num = after - before
    if num == 0 || before == 0
      return 0
    elsif num > 0
      return 1
    else
      return -1
    end
  end
end
