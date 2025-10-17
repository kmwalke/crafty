class ItemType < ApplicationRecord
  TYPES      = {
    building: 'Item::Building',
    tool: 'Item::Tool',
    vehicle: 'Item::Vehicle'
  }.freeze
  TYPE_NAMES = TYPES.values.freeze

  def self.populate_types
    ItemType::TYPE_NAMES.each do |type|
      ItemType.find_or_create_by(name: type)
    end
  end
end
