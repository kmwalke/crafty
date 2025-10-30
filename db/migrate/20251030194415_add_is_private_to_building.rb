class AddIsPrivateToBuilding < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :is_private, :boolean, null: false, default: false
  end
end
