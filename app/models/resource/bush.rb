class Resource::Bush < Resource
  def gather
    Item::Gatherable::Fruit.new(
      name:,
      description: 'Delicious as it is.  Better in a pie',
      level: item_level
    )
  end
end
