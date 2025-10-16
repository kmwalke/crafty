class Resource::Herd < Resource
  def gather
    Item.new(
      name: "#{name} Pelt",
      description: 'A pelt placeholder item. Not good for crafting',
      level: item_level
    )
  end
end
