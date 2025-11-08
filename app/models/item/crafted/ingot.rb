class Item::Crafted::Ingot < Item::Crafted
  def recipe
    [
      ItemType::GATHERABLE[:ore],
      ItemType::GATHERABLE[:ore]
    ]
  end
end
