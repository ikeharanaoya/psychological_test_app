class Question < ApplicationRecord
  # problem テーブル
  belongs_to :problem
  # answers テーブル
  has_many :answers, dependent: :destroy
  # scores_answers 中間テーブル
  has_many :scores_answers
  # scores テーブル
  has_many :scores, through: :scores_answers
end
