class CreateToolTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :item_tool_subtypes, id: false do |t|
      t.string :name, primary_key: true
    end

    Rails.logger.debug '-- populate ResourceTypes'
    ToolType.populates_types
  end
end
