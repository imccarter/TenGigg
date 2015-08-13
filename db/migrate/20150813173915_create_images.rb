class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url, null: false
      t.string :thumbnail_url, null: false
      t.integer :width
      t.integer :height

      t.timestamps null: false
    end
    add_column :users, :image_id, :integer
    add_column :posts, :image_id, :integer
    add_index :users, :image_id
    add_index :posts, :image_id
  end
end
