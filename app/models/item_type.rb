class ItemType < ApplicationRecord
  ITEM       = 'Item'.freeze
  CRAFTABLE  = {
    building: 'Item::Craftable::Building',
    tool: 'Item::Craftable::Tool',
    tool_gathering_tool: 'Item::Craftable::Tool::GatheringTool',
    vehicle: 'Item::Craftable::Vehicle'
  }.freeze
  GATHERABLE = {
    companion: 'Item::Gatherable::Companion',
    fish: 'Item::Gatherable::Fish',
    flower: 'Item::Gatherable::Flower',
    fruit: 'Item::Gatherable::Fruit',
    ore: 'Item::Gatherable::Ore',
    shard: 'Item::Gatherable::Shard',
    wood: 'Item::Gatherable::Wood'
  }.freeze
  TYPE_NAMES = [ITEM, CRAFTABLE.values, GATHERABLE.values].flatten

  def self.populate_types
    ItemType::TYPE_NAMES.each do |type|
      ItemType.find_or_create_by(name: type)
    end
  end
end
