class User < ApplicationRecord
  has_secure_password
  before_create :set_energy
  after_create :create_inventory

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :status, presence: true
  validates :credits, :numericality => { :greater_than_or_equal_to => 0 }

  belongs_to :location, optional: true
  belongs_to :tool, optional: true, class_name: 'Item::Craftable::Tool'
  belongs_to :vehicle, optional: true, class_name: 'Item::Craftable::Vehicle'
  belongs_to :inventory, optional: true

  has_many :listings

  MAX_ENERGY             = 1000
  MAX_AGE                = 100
  MAX_VITALITY           = 100
  DEFAULT_INVENTORY_SIZE = 10

  def actions
    actions = []

    actions << tool.actions unless tool.nil?
    actions << vehicle.actions unless vehicle.nil?

    actions.flatten
  end

  def spend_energy(amount)
    raise CraftyError, 'Can only spend positive energy.' unless amount.positive?
    raise CraftyError, 'You don\'t have enough energy' unless amount <= energy

    update(energy: (energy - amount))
  end

  def equip_item(item)
    raise CraftyError, 'You can only equip items in your inventory' unless inventory.include?(item)

    equip_vehicle(item) if item.type.include? ItemType::TYPES[:craftable_vehicle]
    equip_tool(item) if item.type.include? ItemType::TYPES[:craftable_tool]
  end

  def unequip_tool
    update(tool: nil)
  end

  def unequip_vehicle
    update(vehicle: nil)
  end

  def gather(resource)
    raise CraftyError, 'You can\'t gather without a tool.' if tool.nil?

    tool.gather(resource)
  end

  def travel(new_location)
    raise CraftyError, 'You can\'t travel without a vehicle.' if vehicle.nil?

    vehicle.travel(new_location)
  end

  def valid_travel_locations
    raise CraftyError, 'You can\'t scan for locations without a vehicle.' if vehicle.nil?
    return if vehicle.nil?

    Location.where.not(id: location_id)
  end

  def valid_gather_resources
    raise CraftyError, 'You can\'t scan for resources without a tool.' if tool.nil?

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
