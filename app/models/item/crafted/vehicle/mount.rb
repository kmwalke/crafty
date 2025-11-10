class Item::Crafted::Vehicle::Mount < Item::Crafted::Vehicle
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
end
