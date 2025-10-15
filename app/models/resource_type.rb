class ResourceType < ApplicationRecord
  validates :name, presence: true

  TYPES = {
    crystal: 'Crystal',
    fish: 'Fish',
    forest: 'Forest',
    fruit: 'Fruit',
    herd: 'Herd',
    meadow: 'Meadow',
    ore: 'Ore'
  }.freeze

  TYPE_NAMES = TYPES.values.freeze

  def self.populates_types
    ResourceType::TYPE_NAMES.each do |type|
      ResourceType.find_or_create_by(name: type)
    end
  end
end
