class ItemType < ApplicationRecord
  TYPES      = {
    item: 'Item',
    craftable_building: 'Item::Craftable::Building',
    craftable_coin_copper: 'Item::Craftable::Coin::Copper',
    craftable_tool: 'Item::Craftable::Tool',
    craftable_tool_gathering_tool: 'Item::Craftable::Tool::GatheringTool',
    craftable_vehicle: 'Item::Craftable::Vehicle',
    gatherable_companion: 'Item::Gatherable::Companion',
    gatherable_fish: 'Item::Gatherable::Fish',
    gatherable_flower: 'Item::Gatherable::Flower',
    gatherable_fruit: 'Item::Gatherable::Fruit',
    gatherable_ore: 'Item::Gatherable::Ore',
    gatherable_shard: 'Item::Gatherable::Shard',
    gatherable_wood: 'Item::Gatherable::Wood'
  }.freeze
  TYPE_NAMES = TYPES.values.freeze

  def self.populate_types
    ItemType::TYPE_NAMES.each do |type|
      ItemType.find_or_create_by(name: type)
    end
  end
end
