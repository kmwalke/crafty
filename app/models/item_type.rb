class ItemType < ApplicationRecord
  ITEM       = 'Item'.freeze
  CRAFTED    = {
    pet: 'Item::Crafted::Pet',
    beam: 'Item::Crafted::Beam',
    book: 'Item::Crafted::Book',
    building: 'Item::Crafted::Building',
    component: 'Item::Crafted::Component',
    frame: 'Item::Crafted::Frame',
    harness: 'Item::Crafted::Harness',
    ingot: 'Item::Crafted::Ingot',
    leather: 'Item::Crafted::Leather',
    orb: 'Item::Crafted::Orb',
    paper: 'Item::Crafted::Paper',
    pelt: 'Item::Crafted::Pelt',
    plank: 'Item::Crafted::Plank',
    plastic: 'Item::Crafted::Plastic',
    salad: 'Item::Crafted::Salad',
    screw: 'Item::Crafted::Screw',
    crafting_tool: 'Item::Crafted::Tool::CraftingTool',
    gathering_tool: 'Item::Crafted::Tool::GatheringTool',
    hover_bike: 'Item::Crafted::Vehicle::HoverBike',
    mount: 'Item::Crafted::Vehicle::Mount'
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
  PET        = CRAFTED[:pet].freeze
  TOOL       = 'Item::Crafted::Tool'.freeze
  TOOLS      = {
    crafting_tool: CRAFTED[:crafting_tool],
    gathering_tool: CRAFTED[:gathering_tool]
  }.freeze
  VEHICLE    = 'Item::Crafted::Vehicle'.freeze
  VEHICLES   = {
    hover_bike: CRAFTED[:hover_bike],
    mount: CRAFTED[:mount]
  }.freeze
  TYPE_NAMES = [
    ITEM,
    CRAFTED.values,
    GATHERABLE.values,
    TOOL,
    TOOLS.values,
    VEHICLE,
    VEHICLES.values
  ].uniq.flatten

  def self.populate_types
    ItemType::TYPE_NAMES.each do |type|
      ItemType.find_or_create_by(name: type)
    end
  end
end
