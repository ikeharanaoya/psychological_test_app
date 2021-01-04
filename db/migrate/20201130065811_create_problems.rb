class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|

      # タイトル
      t.string :title, null: false
      # 本文
      t.text :text, null: false
      # パターン
      t.integer :pattern,   null: false

      t.timestamps
    end
  end
end
