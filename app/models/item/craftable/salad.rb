class Item::Craftable::Salad < Item
  include Craftable
  include Useable

  ENERGY = 200

  def recipe
    [
      ItemType::GATHERABLE[:fruit],
      ItemType::GATHERABLE[:fruit],
      ItemType::GATHERABLE[:fruit]
    ]
  end

  def use
    inventory.user.add_energy(ENERGY)
    destroy
  end
end
