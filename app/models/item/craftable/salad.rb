class Item::Craftable::Salad < Item
  def recipe
    [
      ItemType::GATHERABLE[:fruit],
      ItemType::GATHERABLE[:fruit],
      ItemType::GATHERABLE[:fruit]
    ]
  end
end
