class AddChildInvToItems < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :child_inventory_id, :integer
  end
end
