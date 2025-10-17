class AddTypeToInventories < ActiveRecord::Migration[8.0]
  def change
    add_column :inventories, :type, :string
    add_foreign_key :inventories, :item_types, column: :type, primary_key: :name
    add_foreign_key :items, :item_types, column: :type, primary_key: :name
  end
end
