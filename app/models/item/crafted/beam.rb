class Item::Crafted::Beam < Item::Crafted
  def recipe
    {
      ItemType::GATHERABLE[:wood] => 3
    }
  end
end
