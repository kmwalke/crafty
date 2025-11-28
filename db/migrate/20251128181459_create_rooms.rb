class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :dungeon_id
      t.integer :level

      t.timestamps
    end
  end
end
