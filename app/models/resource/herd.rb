class Resource::Herd < Resource
  def gather
    Item::Gatherable::Companion.new(
      name: "#{name} Companion",
      description: 'A pet.  Perhaps it could be trained to be a mount?',
      level: item_level
    )
  end
end
