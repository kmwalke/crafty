class User < ApplicationRecord
  has_secure_password
  before_create :set_energy
  after_create :create_inventory

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :status, presence: true
  validates :credits, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :location, optional: true
  belongs_to :inventory, optional: true
  belongs_to :tool, polymorphic: true, optional: true
  belongs_to :vehicle, polymorphic: true, optional: true

  has_many :listings

  MAX_ENERGY             = 1000
  MAX_AGE                = 100
  MAX_VITALITY           = 100
  DEFAULT_INVENTORY_SIZE = 25

  def actions
    actions = []

    actions << tool.actions unless tool.nil?
    actions << vehicle.actions unless vehicle.nil?

    actions.flatten
  end

  delegate :add_item, to: :active_inventory

  def spend_energy(amount)
    raise CraftyError, 'Can only spend positive energy.' unless amount.positive?
    raise CraftyError, 'You don\'t have enough energy' unless amount <= energy

    update(energy: (energy - amount))
  end

  def add_energy(amount)
    raise CraftyError, 'Can only spend positive energy.' unless amount.positive?

    new_energy = energy + amount
    new_energy = MAX_ENERGY if new_energy > MAX_ENERGY
    update(energy: new_energy)
  end

  def carried_items
    inventory.items + (vehicle&.child_inventory&.items || [])
  end

  def equip_item(item)
    raise CraftyError, 'You can only equip items in your inventory' unless inventory.include?(item)

    equip_vehicle(item) if item.type.include? ItemType::VEHICLE
    equip_tool(item) if item.type.include? ItemType::TOOL
  end

  def remove_item(item)
    inventory.remove_item(item) if inventory.include? item
    vehicle.child_inventory.remove_item(item) if vehicle&.child_inventory&.include? item
  end

  def use_item(item)
    raise CraftyError, 'You can only use items in your inventory' unless inventory.include?(item)

    item.use
  end

  def unequip_tool
    tool.update(parent_inventory: inventory)
    update(tool: nil)
  end

  def unequip_vehicle
    vehicle.update(parent_inventory: inventory)
    update(vehicle: nil)
  end

  private

  def active_inventory
    if vehicle&.inventory_available?
      vehicle.child_inventory
    else
      inventory
    end
  end

  def create_inventory
    Inventory.create(user: self, size: DEFAULT_INVENTORY_SIZE)
  end

  def equip_tool(tool)
    self.tool&.update(parent_inventory: inventory)
    update(tool: tool)
    tool.update(parent_inventory: nil)
  end

  def equip_vehicle(vehicle)
    self.vehicle&.update(parent_inventory: inventory)
    update(vehicle: vehicle)
    vehicle.update(parent_inventory: nil)
  end

  def set_energy
    self.energy = User::MAX_ENERGY
  end
end
