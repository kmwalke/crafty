class Item::Crafted::Book < Item::Crafted
  def recipe
    {
      ItemType::CRAFTED[:paper] => 100,
      ItemType::CRAFTED[:leather] => 2
    }
  end
end
