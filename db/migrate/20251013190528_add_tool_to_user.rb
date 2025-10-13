class AddToolToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :tool_id, :integer
  end
end
