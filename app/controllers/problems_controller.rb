class ProblemsController < ApplicationController
  # 心理テスト画面
  def index
    # 問題情報取得、紐づく質問も取得
    @problem = Problem.includes(:questions).find(1)
    # 分割して、質問項目を取得する
    @questions =  @problem.questions.each_slice(3).to_a[0]
    Form::AnswerCollection.set_count(@questions.length)
    @answers = Form::AnswerCollection.new
  end

  # 回答処理
  def create
    # 問題情報取得、紐づく質問も取得
    @problem = Problem.includes(:questions).find(params[:id])
    # 分割して、質問項目を取得する
    @questions =  @problem.questions.each_slice(3).to_a[0]
    Form::AnswerCollection.set_count(@questions.length)
    # 回答を取得
    @answers = Form::AnswerCollection.new(answer_collection_params)

    binding.pry
    unless @answers.valid?
      render :index and return
    end
    # # 質問でループ処理
    # @questions.each do |question|
    #   # 答えの結果を紐づける
    #   question.answers.new(answer: @answers[question.number.to_s])
    #   # バリデーション確認
    #   unless question.answers[0].valid?
    #     # エラーの場合は、再表示を行い、処理を終了する
    #     render :index and return
    #   end
    # end
  end

  private

  # 回答結果を取得
  def answer_collection_params
    params.require(:form_answer_collection)
    .permit(answers_attributes: [:answer,:question_id])
  end
end
