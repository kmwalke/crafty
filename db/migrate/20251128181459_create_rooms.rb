class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.integer :dungeon_id, null: false
      t.integer :level, null: false

      t.timestamps
    end
  end
end
