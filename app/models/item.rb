class Item < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :level, presence: true

  belongs_to :inventory
  belongs_to :created_by, class_name: 'User'

  LEVELS      = [0, 1, 2, 3, 4].freeze
  LEVEL_NAMES = %w[Common Uncommon Rare Epic Legendary].freeze
  TYPES       = %w[Vehicle Tool].freeze

  def level_name
    LEVEL_NAMES[level]
  end

  def equipable?
    TYPES.include? type
  end
end
