class Score < ApplicationRecord
  # problem テーブル
  belongs_to :problem
  # scores_answers 中間テーブル
  has_many :scores_answers
  # answers テーブル
  has_many :answers, through: :scores_answers
  # division テーブル
  belongs_to :division
end
