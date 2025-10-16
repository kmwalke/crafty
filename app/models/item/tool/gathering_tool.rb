class Item::Tool::GatheringTool < Item::Tool
  before_create :set_type

  self.inheritance_column = 'subtype'

  private

  def set_type
    self.type = ItemType::TYPES[:tool]
  end
end
