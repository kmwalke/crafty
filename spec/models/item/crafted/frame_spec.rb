require 'rails_helper'

RSpec.describe Item::Crafted::Frame do
  let(:user) { create(:user) }

  describe 'crafts' do
    before do
      crafting_tool = create(:crafting_tool, parent_inventory: user.inventory)
      user.equip_item(crafting_tool)
      @new_item     = crafting_tool.craft(
        described_class,
        [
          create(:crafted_ingot, stack_amount: 5, parent_inventory: user.inventory)
        ]
      )
    end

    it 'crafts the item' do
      expect(@new_item.id).not_to be_nil
    end
  end
end
