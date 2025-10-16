class AddColorToItem < ActiveRecord::Migration[8.0]
  def up
    add_column :items, :color, :string

    Item.update_all(color: Item::DEFAULT_COLOR)

    change_column :items, :color, :string, null: false
  end

  def down
    remove_column :items, :color
  end
end
