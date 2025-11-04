class Item::Craftable::Tool::CraftingTool < Item::Craftable::Tool
  attr_accessor :crafted_item, :ingredients

  def actions
    %w[craft]
  end

  def craft(craft_params)
    raise CraftyError, ErrorMessage::ITEM[:must_equip_item] if equipped_by.nil?

    unless equipped_by.spend_energy(energy_usage(craft_params))
      raise CraftyError, ErrorMessage::USER[:build_additional_pylons]
    end

    @crafted_item = craft_params[:item_type].constantize.new
    @ingredients  = craft_params[:item_ids].map do |id|
      Item.find_by(id:)
    end

    raise CraftyError, ErrorMessage::CRAFTING[:failed] unless can_craft?

    craft_the_item
    consume_ingredients if equipped_by.inventory.add_item(@crafted_item)

    @crafted_item
  end

  private

  def can_craft?
    # this doesnt work for stacked items
    @ingredients.pluck(:type) == @crafted_item.recipe
  end

  def craft_the_item
    @crafted_item.created_by  = equipped_by
    @crafted_item.name        = crafted_item_name
    @crafted_item.level       = crafted_item_level
  end

  def consume_ingredients
    # this doesnt work for stacked items
    @ingredients.each(&:destroy)
  end

  def crafted_item_name
    @ingredients.map(&:name).join(' ')
  end

  def crafted_item_level
    @ingredients.first.level
  end

  def energy_usage(craft_params)
    craft_params[:item_ids].count * energy_multiplier
  end
end
