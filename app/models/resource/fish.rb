class Resource::Fish < Resource
  def gather
    Item::Gatherable::Fish.new(
      name:,
      description: 'A legless water creature',
      level: item_level
    )
  end
end
