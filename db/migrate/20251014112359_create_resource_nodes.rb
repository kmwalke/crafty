class CreateResourceNodes < ActiveRecord::Migration[8.0]
  def change
    create_table :resource_nodes do |t|
      t.integer :location_id, null: false
      t.string :type, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
