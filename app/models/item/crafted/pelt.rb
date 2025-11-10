class Item::Crafted::Pelt < Item::Crafted
  def recipe
    {
      ItemType::GATHERABLE[:companion] => 1
    }
  end
end
