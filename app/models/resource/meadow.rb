class Resource::Meadow < Resource
  def default_color
    '#006600'.freeze
  end

  def gather
    Item::Gatherable::Flower.new(
      name:,
      color:,
      description: 'Flowers have many uses.',
      level: item_level
    )
  end
end
