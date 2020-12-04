class Division < ApplicationRecord
  # questions テーブル(外部キー：問題ID、区分)
  has_many :questions, primary_key: [:problem_id, :division_id], foreign_key: [:problem_id, :division_id]
  # scores テーブル(外部キー：問題ID、区分)
  has_many :scores, primary_key: [:problem_id, :division_id], foreign_key: [:problem_id, :division_id]
end
