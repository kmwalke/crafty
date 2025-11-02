class Item::Craftable::Ingot < Item
  include Craftable

  def recipe
    [
      ItemType::GATHERABLE[:ore],
      ItemType::GATHERABLE[:ore]
    ]
  end
end
