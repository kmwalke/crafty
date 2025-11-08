class ChangeItemInventory < ActiveRecord::Migration[8.0]
  def change
    rename_column :items, :inventory_id, :parent_inventory_id
  end
end
