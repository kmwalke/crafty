class Item::Tool::GatheringTool < Item::Tool
  before_create :set_type

  self.inheritance_column = 'subtype'

  def gather(resource)
    resource.gather.update(
      inventory: equipped_by.inventory,
      created_by: equipped_by
    )
  end

  private

  def set_type
    self.type = ItemType::TYPES[:tool]
  end
end
