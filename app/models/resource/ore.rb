class Resource::Ore < Resource
  def default_color
    '#8c8c8c'.freeze
  end

  def gather
    Item::Gatherable::Ore.new(
      name:,
      color:,
      description: 'Just a paperweight until it is smelted',
      level: item_level
    )
  end
end
