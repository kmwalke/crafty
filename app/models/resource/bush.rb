class Resource::Bush < Resource
  def default_color
    '#663300'.freeze
  end

  def gather
    Item::Gatherable::Fruit.new(
      name:,
      color:,
      description: 'Delicious as it is.  Better in a pie',
      level: item_level
    )
  end
end
