class Location < ApplicationRecord
  after_create :create_buildings

  validates :name, presence: true, uniqueness: true
  validates :pos_x, presence: true, uniqueness: { scope: :pos_y }
  validates :pos_y, presence: true
  validates :description, presence: true

  has_many :users
  has_many :resources

  has_one :buildings, class_name: 'Inventory'

  ALLOWABLE_NUM_OF_BUILDINGS = 50

  def distance_from(location)
    Math.sqrt(
      (
        ((location.pos_x - pos_x)**2) -
          ((location.pos_y - pos_y)**2)
      ).abs
    ).round
  end

  def add_building(building)
    buildings.add_item(building)
  end

  private

  def create_buildings
    Inventory.create(location: self, size: ALLOWABLE_NUM_OF_BUILDINGS)
  end
end
