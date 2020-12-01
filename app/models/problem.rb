class Problem < ApplicationRecord
  # questions テーブル
  has_many :questions, dependent: :destroy
  # scores テーブル
  has_many :scores, dependent: :destroy
end
