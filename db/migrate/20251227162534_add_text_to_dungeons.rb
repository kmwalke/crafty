class AddTextToDungeons < ActiveRecord::Migration[8.1]
  def up
    add_column :dungeons, :description, :text

    Dungeon.update_all(description: 'Description')

    change_column :dungeons, :description, :text, null: false
  end

  def down
    remove_column :dungeons, :description
  end
end
