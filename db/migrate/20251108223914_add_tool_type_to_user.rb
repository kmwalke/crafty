class AddToolTypeToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :tool_type, :string
    add_column :users, :vehicle_type, :string
  end
end
