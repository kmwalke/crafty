class Item::Crafted::Paper < Item::Crafted
  def recipe
    {
      ItemType::GATHERABLE[:wood] => 1
    }
  end

  def crafting_yield
    10
  end
end
