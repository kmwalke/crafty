class ItemType < ApplicationRecord
  ITEM       = 'Item'.freeze
  CRAFTED    = {
    book: 'Item::Crafted::Book',
    building: 'Item::Crafted::Building',
    ingot: 'Item::Crafted::Ingot',
    salad: 'Item::Crafted::Salad',
    vehicle: 'Item::Crafted::Vehicle',
    gathering_tool: 'Item::Crafted::Tool::GatheringTool',
    crafting_tool: 'Item::Crafted::Tool::CraftingTool'
  }.freeze
  TOOL       = 'Item::Crafted::Tool'.freeze
  TOOLS      = {
    gathering_tool: ItemType::CRAFTED[:gathering_tool],
    crafting_tool: ItemType::CRAFTED[:crafting_tool]
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
  TYPE_NAMES = [
    ITEM,
    CRAFTED.values,
    GATHERABLE.values,
    TOOL,
    TOOLS.values
  ].flatten

  def self.populate_types
    ItemType::TYPE_NAMES.each do |type|
      ItemType.find_or_create_by(name: type)
    end
  end
end
