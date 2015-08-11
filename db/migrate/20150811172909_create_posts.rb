class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :author_id, null: false
      t.string :title, null: false
      t.integer :popularity, default: 0, null: false

      t.timestamps null: false
    end
    add_index :posts, :author_id
  end
end
