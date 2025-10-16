class Resource::Ore < Resource
  def gather
    Item.new(
      name: "#{name} Ore",
      description: 'An ore placeholder item. Not good for crafting',
      level: item_level
    )
  end
end
