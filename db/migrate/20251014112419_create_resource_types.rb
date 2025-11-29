class CreateResourceTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :resource_types, id: false do |t|
      t.string :name, primary_key: true
    end

    Rails.logger.debug '-- populate ResourceTypes'
    ResourceType.populate

    add_foreign_key :resources, :resource_types, column: :type, primary_key: :name
  end
end
