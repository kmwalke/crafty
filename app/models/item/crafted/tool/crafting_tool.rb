class Item::Crafted::Tool::CraftingTool < Item::Crafted::Tool
  attr_accessor :crafted_item, :ingredients

  def actions
    %w[craft recipes]
  end

  def craft(crafted_item, ingredients)
    @crafted_item = crafted_item
    @ingredients  = ingredients

    unless equipped_by.spend_energy(energy_usage(crafted_item, ingredients))
      raise CraftyError, ErrorMessage::USER[:build_additional_pylons]
    end

    can_craft?

    craft_the_item
    crafted = equipped_by.inventory.add_item(@crafted_item)
    consume_ingredients if crafted

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

    proposed_recipe =
      @ingredients.each_with_object({}) do |i, hash|
        hash[i.type] ||= 0
        hash[i.type]  += i.stack_amount
      end

    matches_recipe?(proposed_recipe)
  end

  def craft_the_item
    @crafted_item.created_by   = equipped_by
    @crafted_item.name         = @crafted_item.build_name(@ingredients)
    @crafted_item.level        = crafted_item_level
    @crafted_item.stack_amount = @crafted_item.crafting_yield
  end

  def consume_ingredients
    @crafted_item.recipe.each do |recipe_type, recipe_amount|
      typed_ingredients(recipe_type).each do |ingredient|
        consume_item_stack(ingredient, recipe_amount)
      end
    end
  end

  def consume_item_stack(item, amount)
    while item.stack_amount.positive? && amount.positive?
      item.stack_amount -= 1
      amount            -= 1
    end
    item.save
  end

  def typed_ingredients(type)
    @ingredients.select { |i| i.type == type }
  end

  def matches_recipe?(proposed_recipe)
    match = true
    @crafted_item.recipe.each do |recipe_type, recipe_amount|
      match &&= proposed_recipe[recipe_type] >= recipe_amount
    end
    raise CraftyError, ErrorMessage::CRAFTING[:wrong_ingredients] unless match
  end

  def crafted_item_level
    @ingredients.pluck(:level).min
  end

  def energy_usage(_item, ingredients)
    ingredients.count * energy_multiplier
  end
end
