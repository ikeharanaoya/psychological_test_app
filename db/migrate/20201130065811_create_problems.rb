class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|

      # タイトル
      t.string :title, null: false
      # 本文
      t.string :text, null: false
      
      t.timestamps
    end
  end
end
