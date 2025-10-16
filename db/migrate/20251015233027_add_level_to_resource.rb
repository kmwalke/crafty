class AddLevelToResource < ActiveRecord::Migration[8.0]
  def up
    add_column :resources, :level, :integer

    Resource.update_all(level: Level::COMMON)

    change_column :resources, :level, :integer, null: false
  end
end
