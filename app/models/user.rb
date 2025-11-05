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
  belongs_to :crafting_tool, optional: true,
                             class_name: 'Item::Craftable::Tool::CraftingTool',
                             foreign_key: 'tool_id',
                             inverse_of: :equipped_by
  belongs_to :gathering_tool, optional: true,
                              class_name: 'Item::Craftable::Tool::GatheringTool',
                              foreign_key: 'tool_id',
                              inverse_of: :equipped_by
  belongs_to :vehicle, optional: true, class_name: 'Item::Craftable::Vehicle'

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

  def add_energy(amount)
    raise CraftyError, 'Can only spend positive energy.' unless amount.positive?

    new_energy = energy + amount
    new_energy = MAX_ENERGY if new_energy > MAX_ENERGY
    update(energy: new_energy)
  end

  def tool
    gathering_tool || crafting_tool
  end

  def equip_item(item)
    ActiveRecord::Base.transaction do
      raise CraftyError, 'You can only equip items in your inventory' unless inventory.include?(item)

      tool&.update(inventory:)
      equip_vehicle(item) if item.type.include? ItemType::CRAFTABLE[:vehicle]
      equip_tool(item) if item.type.include? ItemType::TOOL
    end
  end

  def unequip_tool
    ActiveRecord::Base.transaction do
      tool.update(inventory: inventory)
      update(gathering_tool: nil)
      update(crafting_tool: nil)
    end
  end

  def unequip_vehicle
    ActiveRecord::Base.transaction do
      vehicle.update(inventory: inventory)
      update(vehicle: nil)
    end
  end

  def craft(craft_params)
    raise CraftyError, 'You can\'t craft without a tool.' if crafting_tool.nil?

    crafting_tool.craft(craft_params)
  end

  def gather(resource)
    raise CraftyError, 'You can\'t gather without a tool.' if gathering_tool.nil?

    gathering_tool.gather(resource)
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
    update(gathering_tool: tool) if tool.type.include? ItemType::TOOLS[:gathering_tool]
    update(crafting_tool: tool) if tool.type.include? ItemType::TOOLS[:crafting_tool]
    tool.update(inventory: nil)
  end

  def equip_vehicle(vehicle)
    update(vehicle: vehicle)
    vehicle.update(inventory: nil)
  end

  def set_energy
    self.energy = User::MAX_ENERGY
  end
end
