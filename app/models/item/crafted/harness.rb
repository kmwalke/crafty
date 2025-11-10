class Item::Crafted::Harness < Item::Crafted
  def recipe
    {
      ItemType::CRAFTED[:leather] => 5,
      ItemType::GATHERABLE[:wood] => 1,
      ItemType::CRAFTED[:orb] => 1
    }
  end
end
