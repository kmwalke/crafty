class Item::Crafted::Salad < Item::Crafted
  include Useable

  ENERGY = 100

  def description
    "Restores #{energy} energy."
  end

  def energy
    ENERGY * level
  end

  def recipe
    {
      ItemType::GATHERABLE[:fruit] => 3
    }
  end

  def use
    parent_inventory.user.add_energy(energy)
    consume_self
  end
end
