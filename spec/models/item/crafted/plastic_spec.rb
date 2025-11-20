require 'rails_helper'

RSpec.describe Item::Crafted::Plastic do
  let(:user) { create(:user) }

  describe 'crafts' do
    before do
      crafting_tool = create(:crafting_tool, parent_inventory: user.child_inventory)
      user.equip_item(crafting_tool)
      @new_item     = crafting_tool.craft(
        described_class,
        [
          create(:gatherable_wood, stack_amount: 1, parent_inventory: user.child_inventory),
          create(:crafted_orb, stack_amount: 3, parent_inventory: user.child_inventory)
        ]
      )
    end

    it 'crafts the item' do
      expect(@new_item.id).not_to be_nil
    end

    it 'crafts a yield' do
      expect(@new_item.stack_amount).to eq(2)
    end
  end
end
