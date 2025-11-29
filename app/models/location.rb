class Location < ApplicationRecord
  before_create :provision_property

  validates :name, presence: true, uniqueness: true
  validates :pos_x, presence: true, uniqueness: { scope: :pos_y }
  validates :pos_y, presence: true
  validates :description, presence: true

  has_many :dungeons
  has_many :quests
  has_many :users
  has_many :resources

  belongs_to :property, class_name: 'Inventory', optional: true

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
    property.add_item(building)
  end

  def type
    return 'City' if property.count > 10
    return 'Town' if property.count > 5
    return 'Village' if property.any?

    'Wilderness'
  end

  private

  def provision_property
    create_property(size: ALLOWABLE_NUM_OF_BUILDINGS)
  end
end
