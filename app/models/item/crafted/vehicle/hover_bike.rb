class Item::Crafted::Vehicle::HoverBike < Item::Crafted::Vehicle
  def recipe
    {
      ItemType::CRAFTED[:frame] => 1,
      ItemType::CRAFTED[:component] => 30,
      ItemType::CRAFTED[:plastic] => 10
    }
  end
end
