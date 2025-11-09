class Item::Crafted::Screw < Item::Crafted
  def recipe
    [
      ItemType::CRAFTED[:ingot]
    ]
  end

  def crafting_yield
    100
  end
end
