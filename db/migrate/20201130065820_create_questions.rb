class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|

      # 番号
      t.integer :number,        null: false
      # 本文
      t.text :text,           null: false
      # 区分
      t.integer :division_id,   null: false
      # 評価
      t.integer :valuation,     null: false
      # 反転項目
      t.boolean :inversion,     null: false, default: false

      # problems テーブル
      t.references :problem,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
