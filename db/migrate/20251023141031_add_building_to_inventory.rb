class AddBuildingToInventory < ActiveRecord::Migration[8.0]
  def change
    add_column :inventories, :building_id, :integer
  end
end
