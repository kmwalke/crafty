class Resource::Meadow < Resource
  def gather
    Item::Gatherable::Flower.new(
      name:,
      description: 'Flowers have many uses.',
      level: item_level
    )
  end
end
