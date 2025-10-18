class Resource::Ore < Resource
  def gather
    Item::Gatherable::Ore.new(
      name: "#{name} Ore",
      description: 'Just a paperweight until it is smelted',
      level: item_level
    )
  end
end
