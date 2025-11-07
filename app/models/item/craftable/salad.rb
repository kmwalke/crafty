class Item::Craftable::Salad < Item
  include Craftable
  include Useable

  ENERGY = 100

  def recipe
    [
      ItemType::GATHERABLE[:fruit],
      ItemType::GATHERABLE[:fruit],
      ItemType::GATHERABLE[:fruit]
    ]
  end

  def use
    inventory.user.add_energy(ENERGY * level)
    destroy
  end
end
