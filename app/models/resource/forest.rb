class Resource::Forest < Resource
  def gather
    Item::Gatherable::Wood.new(
      name: "#{name} Wood",
      description: 'Carpenter\'s Delight.',
      level: item_level
    )
  end
end
