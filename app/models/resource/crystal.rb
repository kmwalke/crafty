class Resource::Crystal < Resource
  def gather
    Item::Gatherable::Shard.new(
      name: "#{name} Shard",
      description: 'A small bit of crystal.',
      level: item_level
    )
  end
end
