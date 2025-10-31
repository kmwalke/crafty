class Item::Craftable::Tool::CraftingTool < Item::Craftable::Tool
  def craft(item)
    raise CraftyError, ErrorMessage::ITEM[:must_equip_item] if equipped_by.nil?
  end
end
