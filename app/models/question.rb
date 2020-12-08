class Question < ApplicationRecord
  # problem テーブル
  belongs_to :problem
  # answers テーブル
  has_many :answers, dependent: :destroy

  # division テーブル
  belongs_to :division, dependent: :destroy, primary_key: [:problem_id, :division_id], foreign_key: [:problem_id, :division_id]
end
