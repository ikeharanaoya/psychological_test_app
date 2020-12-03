class Question < ApplicationRecord
  # problem テーブル
  belongs_to :problem
  # answers テーブル
  has_many :answers, dependent: :destroy
end