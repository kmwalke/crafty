class Item::Craftable::Salad < Item
  include Makeable
  include Useable

  ENERGY = 100

  def energy
    ENERGY * level
  end

  def recipe
    [
      ItemType::GATHERABLE[:fruit],
      ItemType::GATHERABLE[:fruit],
      ItemType::GATHERABLE[:fruit]
    ]
  end

  def use
    parent_inventory.user.add_energy(energy)
    if stack_amount > 1
      update(stack_amount: (stack_amount - 1))
    else
      destroy
    end
  end
end
