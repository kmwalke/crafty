class Item::Crafted::Harness < Item::Crafted
  def recipe
    {
      ItemType::CRAFTED[:leather] => 5,
      ItemType::GATHERABLE[:wood] => 1,
      ItemType::CRAFTED[:orb] => 1
    }
  end

  def build_name(ingredients)
    ingredients.select { |i| i.type == ItemType::CRAFTED[:orb] }.first.name
  end
end
