class ProblemsController < ApplicationController
  # 心理テスト画面
  def index
    # 問題情報取得、紐づく質問も取得
    @problem = Problem.includes(:questions).find(1)
    # 分割して、質問項目を取得する
    @questions =  @problem.questions.each_slice(3).to_a[0]
  end

  # 回答処理
  def update
    # 問題情報取得、紐づく質問も取得
    @problem = Problem.includes(:questions).find(params[:id])
    # 分割して、質問項目を取得する
    @questions =  @problem.questions.each_slice(3).to_a[0]
    # 回答を取得
    @answers = answer_params

    # 質問でループ処理
    @questions.each do |question|
      # 答えの結果を紐づける
      question.answers.new(answer: @answers[question.number.to_s])
    end

    # binding.pry
  end

  private

  # 回答結果を取得
  def answer_params
    params.require(:answer)
  end
end
