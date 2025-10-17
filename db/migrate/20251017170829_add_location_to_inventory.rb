class AddLocationToInventory < ActiveRecord::Migration[8.0]
  def change
    add_column :inventories, :location_id, :integer
  end
end
