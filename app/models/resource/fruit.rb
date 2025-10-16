class Resource::Fruit < Resource
  def gather
    Item.new(
      name: "#{name} Fruit",
      description: 'A fruit placeholder item. Not good for crafting',
      level: item_level
    )
  end
end
