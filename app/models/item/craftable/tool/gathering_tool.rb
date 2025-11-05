class Item::Craftable::Tool::GatheringTool < Item::Craftable::Tool
  def actions
    %w[gather]
  end

  def gather(resource)
    ActiveRecord::Base.transaction do
      raise CraftyError, ErrorMessage::ITEM[:must_equip_item] if equipped_by.nil?

      unless equipped_by.spend_energy(energy_usage(resource))
        raise CraftyError, ErrorMessage::USER[:build_additional_pylons]
      end

      item            = resource.gather
      item.created_by = equipped_by

      equipped_by.inventory.add_item(item)

      item
    end
  end

  private

  def energy_usage(resource)
    resource.level * energy_multiplier
  end
end
