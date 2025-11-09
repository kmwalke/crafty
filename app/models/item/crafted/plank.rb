class Item::Crafted::Plank < Item::Crafted
  def recipe
    [
      ItemType::GATHERABLE[:wood],
      ItemType::GATHERABLE[:wood]
    ]
  end
end
