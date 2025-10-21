class Resource::Forest < Resource
  def default_color
    '#009900'.freeze
  end

  def gather
    Item::Gatherable::Wood.new(
      name:,
      color:,
      description: 'Carpenter\'s Delight.',
      level: item_level
    )
  end
end
