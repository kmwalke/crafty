class Item::Tool::GatheringTool < Item::Tool
  before_create :set_type

  self.inheritance_column = 'subtype'

  def gather(resource)
    return unless equipped_by&.spend_energy(energy_usage(resource))

    resource.gather.update(
      inventory: equipped_by.inventory,
      created_by: equipped_by
    )
  end

  private

  def energy_usage(resource)
    resource.level * energy_multiplier
  end

  def set_type
    self.type = ItemType::TYPES[:tool]
  end
end
