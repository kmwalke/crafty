class Item::Crafted::Harness < Item::Crafted
  def recipe
    {
      ItemType::CRAFTED[:leather] => 5,
      ItemType::CRAFTED[:wood] => 1,
      ItemType::CRAFTED[:orb] => 1
    }
  end
end
