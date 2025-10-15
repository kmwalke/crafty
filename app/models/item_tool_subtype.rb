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

  def self.populate_types
    ItemToolSubtype::TYPE_NAMES.each do |type|
      ItemToolSubtype.find_or_create_by(name: type)
    end
  end
end
