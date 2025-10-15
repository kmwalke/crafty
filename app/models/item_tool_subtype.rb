class ItemToolSubtype < ApplicationRecord
  validates :name, presence: true

  TYPES = {
    resonator: 'Resonator',
    fishing_pole: 'Fishing Pole',
    saw: 'Saw',
    secateurs: 'Secateurs',
    sheers: 'Sheers',
    gardening_gloves: 'Gardening Gloves',
    pickaxe: 'Pickaxe'
  }.freeze

  TYPE_NAMES = TYPES.values.freeze

  def self.populates_types
    ResourceType::TYPE_NAMES.each do |type|
      ResourceType.find_or_create_by(name: type)
    end
  end
end
