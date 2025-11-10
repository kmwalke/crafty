class Item::Crafted::Book < Item::Crafted
  def recipe
    {
      Item::CRAFTED[:paper] => 100,
      Item::CRAFTED[:leather] => 2
    }
  end
end
