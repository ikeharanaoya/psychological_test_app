class UsersController < ApplicationController
  def show
    # ユーザーの評価履歴を取得(問題ID、ユーザID)
    @scores = Score.includes(:division).where(problem_id: params["problem_id"],user_id: params["id"])
    # 合計値リスト
    @sum_list = @scores.group(:count).sum(:sum)

    # グラフ用の情報リスト生成
    @scores_js = []

    # 回数毎に繰り返し
    @sum_list.each do |sum|
      # 回数毎のグラフ用に情報を整理（合計、区分、本文）
      @scores_js += [@scores.where(count: sum[0]).to_json(only: [:sum],
        include: { division: { only: [:division_id, :text] } })]
    end
    # binding.pry
  end
end
