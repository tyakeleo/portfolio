class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.string :title
      t.string :image
      t.string :image_url
      t.string :product_image
      t.string :product_url
      t.string :product_name
      t.string :product_review
      t.float  :rate

      t.timestamps
    end
  end
end
