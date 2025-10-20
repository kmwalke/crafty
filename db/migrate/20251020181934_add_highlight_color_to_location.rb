class AddHighlightColorToLocation < ActiveRecord::Migration[8.0]
  def change
    add_column :locations, :highlight_color, :string
  end
end
