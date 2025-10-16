class Item::ToolSubtype < ApplicationRecord
  validates :name, presence: true

  TYPES = {
    # resonator: 'Resonator',
    # fishing_pole: 'Fishing Pole',
    # saw: 'Saw',
    # secateurs: 'Secateurs',
    # sheers: 'Sheers',
    # gardening_gloves: 'Gardening Gloves',
    # pickaxe: 'Pickaxe'
    gathering_tool: 'Gathering Tool',
    crafting_tool: 'Crafting Tool',
    weapon: 'Weapon'
  }.freeze

  TYPE_NAMES = TYPES.values.freeze

  def self.populate_types
    Item::ToolSubtype::TYPE_NAMES.each do |type|
      Item::ToolSubtype.find_or_create_by(name: type)
    end
  end
end
