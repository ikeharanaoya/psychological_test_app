class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|

      # 回数
      t.integer :count, null: false, default: 1
      # 合計
      t.integer :sum, null: false, default: 0
      # 区分
      t.integer :division_id, null: false
      # problems テーブル
      t.references :problem,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
