class Item::Crafted::Component < Item::Crafted
  def recipe
    {
      ItemType::CRAFTED[:ingot] => 1
    }
  end

  def crafting_yield
    10
  end
end
