class Resource::Ore < Resource
  def gather
    Item::Gatherable::Ore.new(
      name:,
      description: 'Just a paperweight until it is smelted',
      level: item_level
    )
  end
end
