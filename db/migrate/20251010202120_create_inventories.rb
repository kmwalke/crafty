class CreateInventories < ActiveRecord::Migration[8.0]
  def change
    create_table :inventories do |t|
      t.integer :user_id
      t.integer :size, null: false, default: 1

      t.timestamps
    end
  end
end
