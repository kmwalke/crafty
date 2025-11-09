class Item::Crafted::Beam < Item::Crafted
  def recipe
    [
      ItemType::GATHERABLE[:wood],
      ItemType::GATHERABLE[:wood],
      ItemType::GATHERABLE[:wood]
    ]
  end
end
