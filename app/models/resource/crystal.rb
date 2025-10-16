class Resource::Crystal < Resource
  def gather
    Item.new(
      name: 'Crystal',
      description: 'A crystal placeholder item. Not good for crafting',
      level: item_level
    )
  end
end
