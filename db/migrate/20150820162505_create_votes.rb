class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.integer :vote_score, null: false

      t.timestamps null: false
    end
    add_index :votes, [:user_id, :post_id], unique: true

  end
end
