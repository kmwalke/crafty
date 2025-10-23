class ReverseInventoryIds < ActiveRecord::Migration[8.0]
  def change
    remove_column :inventories, :user_id, :integer
    remove_column :inventories, :location_id, :integer

    add_column :locations, :property_id, :integer
    add_column :users, :inventory_id, :integer
  end
end
