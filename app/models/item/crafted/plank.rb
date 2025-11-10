class Item::Crafted::Plank < Item::Crafted
  def recipe
    {
      ItemType::GATHERABLE[:wood] => 2
    }
  end
end
