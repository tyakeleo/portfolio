class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true
      t.references :follow, foreign_key: { to_table: :users }
      t.string :name
      t.string :image
      t.string :image_url
      t.string :myprofile

      t.timestamps

      t.index [:user_id, :follow_id], unique: true
    end
  end
end
