class Resource::Forest < Resource
  def gather
    Item::Gatherable::Wood.new(
      name:,
      description: 'Carpenter\'s Delight.',
      level: item_level
    )
  end
end
