require 'rails_helper'

RSpec.describe Item::Crafted::Component do
  let(:user) { create(:user) }

  describe 'crafts' do
    before do
      crafting_tool = create(:crafting_tool, parent_inventory: user.child_inventory)
      user.equip_item(crafting_tool)
      @new_item     = crafting_tool.craft(
        described_class,
        [
          create(:crafted_ingot, stack_amount: 1, parent_inventory: user.child_inventory)
        ]
      )
    end

    it 'creates the item' do
      expect(@new_item.id).not_to be_nil
    end

    it 'crafts a yield' do
      expect(@new_item.stack_amount).to eq(10)
    end
  end
end
