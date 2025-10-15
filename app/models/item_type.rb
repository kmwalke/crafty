class ItemType < ApplicationRecord
  TYPES      = {
    vehicle: 'Item::Vehicle',
    tool: 'Item::Tool'
  }.freeze
  TYPE_NAMES = TYPES.values.freeze

  def self.populates_types
    ItemType::TYPE_NAMES.each do |type|
      ItemType.find_or_create_by(name: type)
    end
  end
end
