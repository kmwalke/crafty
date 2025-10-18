class Item::Tool::GatheringTool < Item::Tool
  before_create :set_type

  self.inheritance_column = 'subtype'

  def gather(resource)
    raise CraftyError, ErrorMessage::ITEM[:must_equip_item] if equipped_by.nil?

    unless equipped_by.spend_energy(energy_usage(resource))
      raise CraftyError, ErrorMessage::USER[:build_additional_pylons]
    end

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
