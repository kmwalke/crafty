class Item::Craftable::Ingot < Item
  include Makeable

  def recipe
    [
      ItemType::GATHERABLE[:ore],
      ItemType::GATHERABLE[:ore]
    ]
  end
end
