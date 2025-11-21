class AddBagTypeToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :pet_type, :string
    add_column :users, :pet_id, :integer
  end
end
