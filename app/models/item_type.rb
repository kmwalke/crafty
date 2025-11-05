class ItemType < ApplicationRecord
  ITEM = 'Item'.freeze
  CRAFTABLE = {
    building: 'Item::Craftable::Building',
    ingot: 'Item::Craftable::Ingot',
    salad: 'Item::Craftable::Salad',
    vehicle: 'Item::Craftable::Vehicle',
    tool: 'Item::Craftable::Tool',
    gathering_tool: 'Item::Craftable::Tool::GatheringTool',
    crafting_tool: 'Item::Craftable::Tool::CraftingTool'
  }.freeze
  TOOLS = {
    gathering_tool: ItemType::CRAFTABLE[:gathering_tool],
    crafting_tool: ItemType::CRAFTABLE[:crafting_tool]
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
  TYPE_NAMES = [ITEM, CRAFTABLE.values, GATHERABLE.values, TOOLS.values].flatten

  def self.populate_types
    ItemType::TYPE_NAMES.each do |type|
      ItemType.find_or_create_by(name: type)
    end
  end
end
