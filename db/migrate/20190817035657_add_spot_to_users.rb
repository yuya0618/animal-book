class AddSpotToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :spot, :string
  end
end
