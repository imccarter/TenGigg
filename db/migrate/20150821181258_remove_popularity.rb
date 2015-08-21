class RemovePopularity < ActiveRecord::Migration
  def change
    remove_column :posts, :popularity
  end
end
