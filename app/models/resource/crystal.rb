class Resource::Crystal < Resource
  def default_color
    '#ff0066'.freeze
  end

  def gather
    Item::Gatherable::Shard.new(
      name:,
      color:,
      description: 'A small bit of crystal.',
      level: item_level
    )
  end
end
