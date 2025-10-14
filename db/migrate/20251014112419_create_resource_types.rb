class CreateResourceTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :resource_types, id: false do |t|
      t.string :name, primary_key: true
    end

    Rails.logger.debug '-- populate ResourceTypes'
    ResourceType.populates_types

    add_foreign_key :resource_nodes, :resource_types, column: :type, primary_key: :name
  end
end
