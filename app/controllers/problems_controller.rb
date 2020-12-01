class ProblemsController < ApplicationController
  # 心理テスト画面
  def index
    # 問題情報取得、紐づく質問も取得
    @problem = Problem.includes(:questions).find(1)
  end
end
