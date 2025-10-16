class Resource::Crystal < Resource
  def gather
    Item.new(
      name: "#{name} Shard",
      description: 'A crystal placeholder item. Not good for crafting',
      level: item_level
    )
  end
end
