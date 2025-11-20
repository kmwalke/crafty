require 'rails_helper'

RSpec.describe Item::Crafted::Bag do
  let(:user) { create(:user) }

  describe 'crafts' do
    before do
      crafting_tool = create(:crafting_tool, parent_inventory: user.child_inventory)
      user.equip_item(crafting_tool)
      @new_item     = crafting_tool.craft(
        described_class,
        [
          create(:crafted_leather, stack_amount: 2, parent_inventory: user.child_inventory)
        ]
      )
    end

    it 'creates the item' do
      expect(@new_item.id).not_to be_nil
    end
  end

  it 'has an inventory' do
    bag = create(:crafted_bag)

    expect(bag.child_inventory).not_to be_nil
  end
end
