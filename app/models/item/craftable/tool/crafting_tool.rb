class Item::Craftable::Tool::CraftingTool < Item::Craftable::Tool
  def actions
    %w[craft]
  end

  def craft(craft_params)
    raise CraftyError, ErrorMessage::ITEM[:must_equip_item] if equipped_by.nil?

    unless equipped_by.spend_energy(energy_usage(craft_params))
      raise CraftyError, ErrorMessage::USER[:build_additional_pylons]
    end

    item = craft_params[:item_type].constantize.new
    
    # check if item_ids matches recipe

    item.created_by = equipped_by

    equipped_by.inventory.add_item(item)

    item
    raise CraftyError, craft_params.to_s
  end

  private

  def energy_usage(craft_params)
    craft_params[:item_ids].count * energy_multiplier
  end
end
