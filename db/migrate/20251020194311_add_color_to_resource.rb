class AddColorToResource < ActiveRecord::Migration[8.0]
  def change
    add_column :resources, :color, :string
  end
end
