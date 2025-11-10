class Item::Crafted::Rubber < Item::Crafted
  def recipe
    {
      ItemType::GATHERABLE[:wood] => 1,
      ItemType::GATHERABLE[:shard] => 3
    }
  end

  def crafting_yield
    2
  end

end
