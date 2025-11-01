class Item::Craftable::Metal < Item
  def recipe
    [
      ItemType::GATHERABLE[:ore],
      ItemType::GATHERABLE[:ore]
    ]
  end
end
