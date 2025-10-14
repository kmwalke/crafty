class AddBgcolorToLocation < ActiveRecord::Migration[8.0]
  def change
    add_column :locations, :bg_color, :string, null: false, default: '#000'
  end
end
