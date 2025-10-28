class CreateListings < ActiveRecord::Migration[8.0]
  def change
    create_table :listings do |t|
      t.integer :item_id
      t.integer :created_by_id
      t.integer :building_id
      t.string :price_type
      t.integer :price_amount
      t.integer :price_level

      t.timestamps
    end
  end
end
