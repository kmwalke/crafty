class CreateItemTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :item_types, id: false do |t|
      t.string :name, primary_key: true
    end

    Rails.logger.debug '-- populate ItemTypes'
    ItemType.populates_types
  end
end
