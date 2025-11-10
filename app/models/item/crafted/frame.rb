class Item::Crafted::Frame < Item::Crafted
  def recipe
    {
      ItemType::CRAFTED[:ingot] => 5
    }
  end
end
