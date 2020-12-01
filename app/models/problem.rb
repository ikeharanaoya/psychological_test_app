class Problem < ApplicationRecord
  # questions テーブル
  has_many :questions, dependent: :destroy
end
