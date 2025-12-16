class Skills < ApplicationRecord
  MIN_LEVEL = 1
  MAX_LEVEL = 1000

  validates :crafting, numericality: { greater_than: 0, less_than_or_equal_to: MAX_LEVEL }
  validates :fighting, numericality: { greater_than: 0, less_than_or_equal_to: MAX_LEVEL }
  validates :gathering, numericality: { greater_than: 0, less_than_or_equal_to: MAX_LEVEL }
  validates :trading, numericality: { greater_than: 0, less_than_or_equal_to: MAX_LEVEL }
  validates :traveling, numericality: { greater_than: 0, less_than_or_equal_to: MAX_LEVEL }

  belongs_to :user
end
