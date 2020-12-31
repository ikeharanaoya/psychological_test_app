class ProblemsController < ApplicationController
  # トップ画面
  def index
    # 問題情報取得
    @problems = Problem.includes([questions: :division])
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

    # グラフ用に情報を整理（合計、区分、基準、最大値、タイトル）
    @scores_js = @scores.scores.to_json(only: [:sum],
                                        include: { division: { only: [:division_id, :text, :standard, :max] }, problem: { only: [:title] } })

    # ログイン確認
    if user_signed_in?
      # ログインしている場合、評価&回答を保存
      @scores.save
    else
      # ログインしていない場合

      # 格納用に変数を初期化
      session['scores_data'] = []
      # 繰り返しカウント
      num = 0
      # 評価をセッションに格納
      @scores.scores.each do |score|
        # 変数の初期化
        add_score = {}
        # 回数を設定
        add_score[:count] = score[:count]
        # 合計点数
        add_score[:sum] = score[:sum]
        # 区分IDを設定
        add_score[:division_id] = score[:division_id]
        # 問題IDを設定
        add_score[:problem_id] = score[:problem_id]

        # セッションに情報を追加
        session['scores_data'] << add_score
        # インクリメント
        num += 1
      end

      # 格納用に変数を初期化
      session['answers_data'] = []
      # 繰り返しカウント
      num = 0
      # 回答をセッションに格納
      @answers.answers.each do |answer|
        # 変数の初期化
        add_answer = {}
        # 回答を設定
        add_answer[:answer] = answer[:answer]
        # 質問IDを設定
        add_answer[:question_id] = answer[:question_id]

        # セッションに情報を追加
        session['answers_data'] << add_answer
        # インクリメント
        num += 1
      end
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

  # 賢者ボタンのデータ取得処理
  def kenja_search
    # 問題情報取得、紐づく質問も取得
    problem = Problem.includes(questions: :division).find(params[:problem_id])
    # 質問項目を取得する
    questions = problem.questions
    # 回答コレクションの数を質問と同じ数に設定
    Form::AnswerCollection.set_count(questions.length)
    # 回答情報を生成
    answers = Form::AnswerCollection.new

    # 回答結果を返す
    render json: { post: set_answers_question(answers,questions) }
  end

  # 最新ボタンのデータ取得処理
  def new_search
    # 回数の最大値取得
    max = Score.where(problem_id: params[:problem_id], user: current_user.id).maximum(:count)
    # 最新の評価情報を取得
    scores = Score.includes(:answers).where(problem_id: params[:problem_id],user_id: current_user.id,count: max)

    # 問題情報取得、紐づく質問も取得
    problem = Problem.includes(questions: :division).find(params[:problem_id])
    # 質問項目を取得する
    questions = problem.questions
    # 回答コレクションの数を質問と同じ数に設定
    Form::AnswerCollection.set_count(questions.length)
    # 回答情報を生成
    answers = Form::AnswerCollection.new

    # 回答結果を返す
    render json: { post: set_answers_score(answers,scores) }
  end

  # 自己ベストボタンのデータ取得処理
  def best_search
    # 自己ベストの回数の値取得
    best = Score.where(problem_id: params[:problem_id], user: current_user.id).
                      group(:count).sum(:sum).
                      max{ |(_key0,value0),(_key1,value1)| value0<=>value1 }[0]

    # 自己ベストの評価情報を取得
    scores = Score.includes(:answers).where(problem_id: params[:problem_id],user_id: current_user.id,count: best)

    # 問題情報取得、紐づく質問も取得
    problem = Problem.includes(questions: :division).find(params[:problem_id])
    # 質問項目を取得する
    questions = problem.questions
    # 回答コレクションの数を質問と同じ数に設定
    Form::AnswerCollection.set_count(questions.length)
    # 回答情報を生成
    answers = Form::AnswerCollection.new

    # 回答結果を返す
    render json: { post: set_answers_score(answers,scores) }
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

    # ログイン確認
    if user_signed_in?
      # ログインしている場合に検索する

      # 回数の最大値取得
      max = Score.where(problem_id: params[:id], user: current_user.id).maximum(:count)
      unless max.nil?
        # 空以外は値を追加する
        count = max + 1
      end
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

  # 質問情報から、回答結果を設定
  def set_answers_question(answers,questions)
    # 繰り返しカウント
    num = 0
    # 回答結果に質問情報を設定する
    answers.answers.each do |answer|
      # 点数反転確認
      if questions[num].inversion
        # 反転する場合、１を設定
        answer.answer = 1
      else
        # 正常の場合、最大値を設定
        answer.answer = questions[num].valuation
      end
      # インクリメント
      num += 1
    end
    # 回答結果を返す
    answers
  end

  # 評価情報から、回答結果を設定
  def set_answers_score(answers,scores)
    # 繰り返しカウント
    num = 0
    # 回答結果に質問情報を設定する
    scores.each do |score|
      score.answers.each do |answer|
        # 質問IDを設定
        answers.answers[num][:question_id] = answer[:question_id]
        # 答えを設定
        if (answer.question.inversion)
          # 反転する場合は、全体値から答えを引いた値を設定
          answers.answers[num][:answer] = answer.question.valuation - answer.answer + 1
        else
          # 正常の場合は、答えの値を設定
          answers.answers[num][:answer] = answer[:answer]
        end
        # インクリメント
        num += 1
      end
    end
    # 質問IDの昇順で回答結果を返す
    answers.answers.sort do |a,b| a[:question_id] <=> b[:question_id] end
  end
end
