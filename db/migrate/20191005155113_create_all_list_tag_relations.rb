class CreateAllListTagRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :all_list_tag_relations do |t|
      t.references :list, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
