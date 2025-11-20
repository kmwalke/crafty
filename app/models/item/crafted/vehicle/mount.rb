class Item::Crafted::Vehicle::Mount < Item::Crafted::Vehicle
  def actions
    %w[feed] + super
  end

  def recipe
    {
      ItemType::GATHERABLE[:companion] => 1,
      ItemType::CRAFTED[:harness] => 1,
      ItemType::GATHERABLE[:fish] => 10
    }
  end

  def build_name(ingredients)
    ingredients.select { |i| i.type == ItemType::GATHERABLE[:companion] }.first.name
  end

  def feed(fish)
    raise CraftyError, ErrorMessage::MOUNT[:not_favorite] unless fish.type == ItemType::GATHERABLE[:fish]

    fish.destroy if update(boost: fish.level)
  end

  def energy_usage(location1, location2)
    return 0 if boost.positive?

    super
  end

  def travel(location)
    update(boost: boost - 1) if boost.positive?
    super
  end
end
