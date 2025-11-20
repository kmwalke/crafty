class AddBagTypeToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :bag_type, :string
  end
end
