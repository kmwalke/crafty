class Item::Tool::GatheringTool < Item::Tool
  before_create :set_type

  self.inheritance_column = 'subtype'

  def gather(resource)
    raise CraftyError, 'You have to equip a tool to use it.' if equipped_by.nil?
    raise CraftyError, 'You don\'t have enough energy.' unless equipped_by&.spend_energy(energy_usage(resource))

    item            = resource.gather
    item.created_by = equipped_by

    equipped_by.inventory.add_item(item)

    item
  end

  private

  def energy_usage(resource)
    resource.level * energy_multiplier
  end

  def set_type
    self.type = ItemType::TYPES[:tool]
  end
end
