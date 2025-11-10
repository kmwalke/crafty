class Item::Crafted::Tool::CraftingTool < Item::Crafted::Tool
  attr_accessor :crafted_item, :ingredients

  def actions
    %w[craft recipes]
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

    can_craft?

    craft_the_item
    consume_ingredients if equipped_by.inventory.add_item(@crafted_item)

    @crafted_item
  end

  def recipes
    ItemType::CRAFTED.map do |name, recipe|
      { name: name.to_s.gsub('_', ' ').capitalize, recipe: recipe.constantize.new.recipe }
    end
  end

  private

  def can_craft?
    raise CraftyError, ErrorMessage::INVENTORY[:no_space] if equipped_by.inventory.remaining_space.zero?

    recipe_list = @crafted_item.recipe
    @ingredients.each do |i|
      next unless recipe_list.include? i.type

      stack_amount = i.stack_amount
      while recipe_list.any? && stack_amount.positive?
        stack_amount        -= 1
        recipe_list[i.type] -= 1
        recipe_list.except! i.type if recipe_list[i.type].zero?
      end
      i.update(stack_amount:)
    end
    raise CraftyError, ErrorMessage::CRAFTING[:no_ingredients] unless recipe_list.empty?
  end

  def craft_the_item
    @crafted_item.created_by   = equipped_by
    @crafted_item.name         = @crafted_item.build_name(@ingredients)
    @crafted_item.level        = crafted_item_level
    @crafted_item.stack_amount = @crafted_item.crafting_yield
  end

  def consume_ingredients
    @ingredients.each do |i|
      i.destroy if i.stack_amount.zero?
    end
  end

  def crafted_item_level
    @ingredients.pluck(:level).min
  end

  def energy_usage(craft_params)
    craft_params[:item_ids].count * energy_multiplier
  end
end
