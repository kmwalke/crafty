class Item::Crafted::Ingot < Item::Crafted
  def recipe
    {
      ItemType::GATHERABLE[:ore] => 2
    }
  end
end
