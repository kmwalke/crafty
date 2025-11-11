class Item::Crafted::Tool::GatheringTool < Item::Crafted::Tool
  def actions
    %w[gather]
  end

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

  def valid_gather_resources
    Resource.where(location: equipped_by.location)
  end

  private

  def energy_usage(resource)
    resource.level * energy_multiplier
  end
end
