class CreateDungeons < ActiveRecord::Migration[8.0]
  def change
    create_table :dungeons do |t|
      t.string :name
      t.integer :location_id
      t.integer :level

      t.timestamps
    end
  end
end
