class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      # 回答
      t.integer :answer,      null: false
      # questions テーブル
      t.references :question, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
