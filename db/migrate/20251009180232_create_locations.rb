class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.integer :pos_x, null: false
      t.integer :pos_y, null: false
      t.text :description, null: false

      t.timestamps
    end
    add_index :locations, :name, unique: true
  end
end
