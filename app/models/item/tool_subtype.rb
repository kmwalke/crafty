class Item::ToolSubtype < ApplicationRecord
  validates :name, presence: true

  TYPES = {
    # resonator: 'Resonator',
    # fishing_pole: 'Fishing Pole',
    # saw: 'Saw',
    # secateurs: 'Secateurs',
    # sheers: 'Sheers',
    # gardening_gloves: 'Gardening Gloves',
    # pickaxe: 'Pickaxe',
    # weapon: 'Weapon'
    gathering_tool: 'Item::Tool::GatheringTool'
    # crafting_tool: 'Crafting Tool',
  }.freeze

  TYPE_NAMES = TYPES.values.freeze

  def self.populate_types
    Item::ToolSubtype::TYPE_NAMES.each do |type|
      Item::ToolSubtype.find_or_create_by(name: type)
    end
  end
end
