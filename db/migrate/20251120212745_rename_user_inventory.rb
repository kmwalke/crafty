class RenameUserInventory < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :inventory_id, :child_inventory_id
  end
end
