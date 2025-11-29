class ResourceType < ApplicationRecord
  validates :name, presence: true

  TYPES = {
    crystal: 'Resource::Crystal',
    fish: 'Resource::Fish',
    forest: 'Resource::Forest',
    bush: 'Resource::Bush',
    herd: 'Resource::Herd',
    meadow: 'Resource::Meadow',
    ore: 'Resource::Ore'
  }.freeze

  TYPE_NAMES = TYPES.values.freeze

  def self.populate
    ResourceType::TYPE_NAMES.each do |type|
      ResourceType.find_or_create_by(name: type)
    end
  end
end
