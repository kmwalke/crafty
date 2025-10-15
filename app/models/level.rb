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
end
