class Item::Crafted::Orb < Item::Crafted
  def recipe
    {
      ItemType::GATHERABLE[:shard] => 3
    }
  end
end
