require 'rails_helper'

RSpec.describe Item::Crafted::Vehicle::Mount do
  let(:user) { create(:user) }

  describe 'crafts' do
    let(:companion) { create(:gatherable_companion, stack_amount: 1, parent_inventory: user.inventory) }

    before do
      crafting_tool = create(:crafting_tool, parent_inventory: user.inventory)
      user.equip_item(crafting_tool)
      @new_item     = crafting_tool.craft(
        described_class,
        [
          companion,
          create(:crafted_harness, stack_amount: 1, parent_inventory: user.inventory),
          create(:gatherable_fish, stack_amount: 10, parent_inventory: user.inventory)
        ]
      )
    end

    it 'crafts the item' do
      expect(@new_item.id).not_to be_nil
    end

    pending 'version_0.3 feeding the mount gives a bonus'
    # feeding a mount gives some boost
    # maybe requires lees/no energy for a while

    it 'names the item' do
      expect(@new_item.name).to eq(companion.name)
    end
  end
end
