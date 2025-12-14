class ChangeItemDesc < ActiveRecord::Migration[8.1]
  def up
    change_column :items, :description, :text, null: true
  end

  def down
    change_column :items, :description, :text, null: false
  end
end
