class Item::Crafted::Plastic < Item::Crafted
  def recipe
    {
      ItemType::GATHERABLE[:wood] => 1,
      ItemType::CRAFTED[:orb] => 3
    }
  end

  def crafting_yield
    2
  end
end
