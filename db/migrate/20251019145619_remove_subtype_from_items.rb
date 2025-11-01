class RemoveSubtypeFromItems < ActiveRecord::Migration[8.0]
  def change
    reversible do |direction|
      direction.up do
        Item.update_all(type: ItemType::ITEM)
        change_column :items, :type, :string, null: false
      end
      direction.down { change_column :items, :type, :string }
    end
    remove_column :items, :subtype, :string
    drop_table :item_tool_subtypes, id: false do |t|
      t.string :name, primary_key: true
    end
  end
end
