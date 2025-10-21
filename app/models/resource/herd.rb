class Resource::Herd < Resource
  def default_color
    '#EEEEEE'.freeze
  end

  def gather
    Item::Gatherable::Companion.new(
      name:,
      color:,
      description: 'A pet.  Perhaps it could be trained to be a mount?',
      level: item_level
    )
  end
end
