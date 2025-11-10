class Item::Crafted::Screw < Item::Crafted
  def recipe
    {
      ItemType::CRAFTED[:ingot] => 1
    }
  end

  def crafting_yield
    100
  end
end
