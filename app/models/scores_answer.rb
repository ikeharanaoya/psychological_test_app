class ScoresAnswer < ApplicationRecord
  # score テーブル
  belongs_to :score
  # answer テーブル
  belongs_to :answer
end
