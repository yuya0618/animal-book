class RemoveRateFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :rate, :integer
  end
end
