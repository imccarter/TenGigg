class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps null: false
    end

    create_table :post_categories do |t|
      t.integer :post_id, null: false
      t.integer :category_id, null: false

      t.timestamps null: false
    end

    add_index :post_categories, [:post_id, :category_id]
    add_index :post_categories, :post_id
    add_index :post_categories, :category_id
    add_index :categories, :name, unique: true
  end
end
