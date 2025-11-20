class AddBoostedToItem < ActiveRecord::Migration[8.0]
  def change
    add_column :items, :is_boosted, :boolean, null: false, default: false
  end
end
