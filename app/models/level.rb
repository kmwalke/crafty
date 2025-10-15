class Level < ApplicationRecord
  NUMBERS   = [1, 2, 3, 4, 5].freeze
  NAMES     = %w[Common Uncommon Rare Epic Legendary].freeze
  COMMON    = 1
  UNCOMMON  = 2
  RARE      = 3
  EPIC      = 4
  LEGENDARY = 5

  def self.name(level)
    NAMES[level - 1]
  end

  def self.populate_levels
    Level::NUMBERS.each do |level_number|
      Levels.find_or_create_by(id: level_number, name: Level.name(level_number))
    end
  end
end
