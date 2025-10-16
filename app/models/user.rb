class User < ApplicationRecord
  has_secure_password
  before_create :set_energy
  after_create :create_inventory

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :status, presence: true

  belongs_to :location, optional: true
  belongs_to :tool, optional: true, class_name: 'Item::Tool'
  belongs_to :vehicle, optional: true, class_name: 'Item::Vehicle'
  has_one :inventory

  MAX_ENERGY             = 1000
  DEFAULT_INVENTORY_SIZE = 10

  def actions
    actions = []

    actions << tool.actions unless tool.nil?
    actions << vehicle.actions unless vehicle.nil?

    actions.flatten
  end

  def spend_energy(amount)
    return unless amount.positive? && amount <= energy

    update(energy: (energy - amount))
  end

  def equip_item(item)
    return unless inventory.items.include?(item)

    equip_vehicle(item) if item.type == ItemType::TYPES[:vehicle]
    equip_tool(item) if item.type == ItemType::TYPES[:tool]
  end

  def unequip_tool
    update(tool: nil)
  end

  def unequip_vehicle
    update(vehicle: nil)
  end

  def gather(resource)
    return if tool.nil?

    resource.gather.update(
      inventory: inventory,
      created_by: self
    )
  end

  def travel(new_location)
    return if vehicle.nil?

    vehicle.travel(new_location)
  end

  def valid_travel_locations
    return if vehicle.nil?

    Location.all
  end

  def valid_gather_resources
    return if tool.nil?

    Resource.where(location: location)
  end

  private

  def create_inventory
    Inventory.create(user: self, size: DEFAULT_INVENTORY_SIZE)
  end

  def equip_tool(tool)
    update(tool: tool)
  end

  def equip_vehicle(vehicle)
    update(vehicle: vehicle)
  end

  def set_energy
    self.energy = User::MAX_ENERGY
  end
end
