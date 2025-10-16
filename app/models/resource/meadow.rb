class Resource::Meadow < Resource
  def gather
    Item.new(
      name: 'Flower',
      description: 'A flower placeholder item. Not good for crafting',
      level: item_level
    )
  end
end
