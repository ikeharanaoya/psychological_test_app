class CreateDivisions < ActiveRecord::Migration[6.0]
  def change
    create_table :divisions do |t|
      # 区分
      t.integer :division_id,   null: false
      # 本文
      t.string :text,   null: false
      # 基準
      t.integer :standard,   null: false
      # 最大値
      t.integer :max,   null: false
      # problems テーブル
      t.references :problem,    null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
