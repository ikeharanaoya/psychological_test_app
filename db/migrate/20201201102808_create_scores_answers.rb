class CreateScoresAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :scores_answers do |t|
      # answers テーブル
      t.references :answer,    null: false, foreign_key: true
      # scores テーブル
      t.references :score,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
