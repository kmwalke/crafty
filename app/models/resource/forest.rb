class Resource::Forest < Resource
  def gather
    Item.new(
      name: "#{name} Wood",
      description: 'A wood placeholder item. Not good for crafting',
      level: item_level
    )
  end
end
