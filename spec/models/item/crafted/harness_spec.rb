require 'rails_helper'

RSpec.describe Item::Crafted::Harness do
  let(:user) { create(:user) }
  let(:orb) { create(:crafted_orb, stack_amount: 1, parent_inventory: user.inventory) }

  describe 'crafts' do
    before do
      crafting_tool = create(:crafting_tool, parent_inventory: user.inventory)
      user.equip_item(crafting_tool)
      @new_item     = crafting_tool.craft(
        described_class,
        [
          create(:crafted_leather, stack_amount: 5, parent_inventory: user.inventory),
          create(:gatherable_wood, stack_amount: 1, parent_inventory: user.inventory),
          orb
        ]
      )
    end

    it 'crafts the item' do
      expect(@new_item.id).not_to be_nil
    end

    it 'names the item' do
      expect(@new_item.name).to eq(orb.name)
    end
  end
end
