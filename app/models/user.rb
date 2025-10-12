class User < ApplicationRecord
  has_secure_password
  after_create :create_inventory

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :status, presence: true

  belongs_to :location, optional: true
  belongs_to :vehicle, optional: true
  has_one :inventory

  DEFAULT_ENERGY         = 1000
  DEFAULT_INVENTORY_SIZE = 10

  def actions
    actions = []

    actions << vehicle.actions unless vehicle.nil?

    actions.flatten
  end

  def spend_energy(amount)
    return unless amount.positive?

    update(energy: (energy - amount))
  end

  def equip_vehicle(vehicle)
    return unless vehicle.type == Vehicle.name &&
                  inventory.items.include?(vehicle)

    update(vehicle: vehicle)
  end

  def travel(new_location)
    return if vehicle.nil?

    vehicle.travel(new_location)
  end

  def valid_travel_locations
    Location.all
  end

  private

  def create_inventory
    Inventory.create(user: self, size: DEFAULT_INVENTORY_SIZE)
  end
end
