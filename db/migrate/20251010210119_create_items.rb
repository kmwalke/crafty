class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :level, null: false
      t.integer :inventory_id
      t.integer :created_by_id, null: false
      t.string :type

      t.timestamps
    end
  end
end
