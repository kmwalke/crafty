class ItemType < ApplicationRecord
  TYPES      = {
    item: 'Item',
    craftable_building: 'Item::Craftable::Building',
    gatherable_companion: 'Item::Gatherable::Companion',
    gatherable_fish: 'Item::Gatherable::Fish',
    gatherable_flower: 'Item::Gatherable::Flower',
    gatherable_fruit: 'Item::Gatherable::Fruit',
    gatherable_ore: 'Item::Gatherable::Ore',
    gatherable_shard: 'Item::Gatherable::Shard',
    gatherable_wood: 'Item::Gatherable::Wood',
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
