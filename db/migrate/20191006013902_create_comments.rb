class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :list, foreign_key: true
      # nullだと保存できないようにする
      t.string :name, null: false
      t.text :comment, null:false

      t.timestamps
    end
  end
end
