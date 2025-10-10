class AddVehicleToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :vehicle_id, :integer
  end
end
