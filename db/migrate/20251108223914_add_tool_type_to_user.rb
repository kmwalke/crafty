class AddToolTypeToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :tool_type, :string
  end
end
