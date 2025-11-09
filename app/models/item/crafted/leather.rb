class Item::Crafted::Leather < Item::Crafted
  def recipe
    {
      ItemType::CRAFTED[:pelt] => 1
    }
  end

  def crafting_yield
    10
  end
end
