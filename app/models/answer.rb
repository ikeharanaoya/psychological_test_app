class Answer < ApplicationRecord
  # question テーブル
  belongs_to :question
  # scores_answers 中間テーブル
  has_many :scores_answers
  # scores テーブル
  has_many :scores, through: :scores_answers

  # 必須項目
  validates :answer, presence: true
end
