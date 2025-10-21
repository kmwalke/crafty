class Resource::Fish < Resource
  def default_color
    '#0000ff'.freeze
  end

  def gather
    Item::Gatherable::Fish.new(
      name:,
      color:,
      description: 'A legless water creature',
      level: item_level
    )
  end
end
