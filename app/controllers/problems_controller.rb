class ProblemsController < ApplicationController
  # トップ画面
  def index
    # 問題情報取得
    @problems = Problem.includes(questions: :division).all
  end

  # 心理テスト画面
  def show
    # 問題情報取得、紐づく質問も取得
    @problem = Problem.includes(questions: :division).find(params[:id])
    # 質問項目を取得する
    @questions = @problem.questions
    # 回答コレクションの数を質問と同じ数に設定
    Form::AnswerCollection.set_count(@questions.length)
    # 回答情報を生成
    @answers = Form::AnswerCollection.new
  end

  # 回答処理
  def create
    # 問題情報取得、紐づく質問も取得
    @problem = Problem.includes(questions: :division).find(params[:id])
    # 質問項目を取得する
    @questions = @problem.questions
    # 回答コレクションの数を質問と同じ数に設定
    Form::AnswerCollection.set_count(@questions.length)
    # 回答を取得
    @answers = Form::AnswerCollection.new(answer_collection_params)

    # バリデーション確認 エラーの場合は再表示
    render :show and return unless @answers.valid?

    # 質問の区分を取得
    @divisions = @questions.group(:division_id)
    # 評価コレクションの数を質問（区分数）と同じ数に設定
    Form::ScoreCollection.set_count(@divisions.length)
    # 評価コレクションを生成
    @scores = Form::ScoreCollection.new

    # 評価の回数(最大値)取得
    count = score_max_count
    # ユーザIDの取得
    user_id = get_user_id
    # 繰り返しカウント
    num = 0

    # 区分事の情報をコレクションに設定
    @scores.scores.each do |score|
      # 回数を設定
      score[:count] = count
      # 区分IDを設定
      score[:division_id] = @divisions[num].division_id
      # 問題IDを設定
      score[:problem_id] = @divisions[num].problem_id
      # ユーザーID設定
      score[:user_id] = user_id
      # インクリメント
      num += 1
    end

    # 合計値
    @sum = 0
    # 回答結果を評価に設定する
    @answers.answers.each do |answer|
      # 答えの反転確認
      if answer.question.inversion
        # 反転する場合は、全体値から答えを引いた値を設定
        answer.answer = answer.question.valuation - answer.answer + 1
      end

      # 回答→質問から区分を取得
      division_id = answer.question.division_id
      # 区分に紐づく評価を取得
      score = @scores.scores.find { |a| a[:division_id] == division_id }
      # 評価の合計に点数を加算
      score.sum += answer.answer
      # 評価と回答を紐づける
      score.answers.build(answer.attributes)

      # 合計値
      @sum += answer.answer
    end

    # グラフ用に情報を整理（合計、区分、本文）
    @scores_js = @scores.scores.to_json(only: [:sum],
                                        include: { division: { only: [:division_id, :text] } })

    # ログイン確認
    if user_signed_in?
      # ログインしている場合、評価&回答を保存
      @scores.save
    end

    # 合計点数順に降順
    @score_sort = @scores.scores.sort_by { |a| a[:sum] }.reverse

    # 上位の配列
    @scores_up = []
    # 下位の配列
    @scores_down = []
    # 同列確認用の変数
    score_point = 0
    # ソートした配列で繰り返す
    @score_sort.each do |score|
      # 上位が２つ以下または、基準値と同列の場合
      if @scores_up.length < 2 || score_point == score.sum
        # 上位に追加
        @scores_up += [score]
        # 点数を更新
        score_point = score.sum
      else
        # 下位に追加
        @scores_down += [score]
      end
    end
    # binding.pry
  end

  private

  # 回答結果を取得
  def answer_collection_params
    params.require(:form_answer_collection)
          .permit(answers_attributes: [:answer, :question_id])
  end

  # 評価の回数(最大値)取得
  def score_max_count
    # 初期化
    count = 1

    # 回数の最大値取得
    max = Score.maximum(:count)
    unless max.nil?
      # 空以外は値を追加する
      count = max + 1
    end

    count
  end

  # ユーザIDの取得
  def get_user_id
    # 初期化
    user_id = nil
    # ログイン確認
    if user_signed_in?
      # ログインしているユーザーのID設定
      user_id = current_user.id
    end

    user_id
  end
end
