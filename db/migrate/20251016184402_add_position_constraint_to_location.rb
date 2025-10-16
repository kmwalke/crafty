class AddPositionConstraintToLocation < ActiveRecord::Migration[8.0]
  def change
    add_index :locations, [:pos_x, :pos_y], unique: true
  end
end
