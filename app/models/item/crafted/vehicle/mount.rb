class Item::Crafted::Vehicle::Mount < Item::Crafted::Vehicle
  def recipe
    {
      ItemType::GATHERABLE[:companion] => 1,
      ItemType::CRAFTED[:harness] => 1,
      ItemType::GATHERABLE[:fish] => 10
    }
  end
end
