class Resource::Fish < Resource
  def gather
    Item.new(
      name: "#{name} Fish",
      description: 'A fish placeholder item. Not good for crafting',
      level: item_level
    )
  end
end
