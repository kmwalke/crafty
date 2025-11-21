require 'rails_helper'

RSpec.describe Item::Crafted::Pet do
  let(:user) { create(:user) }

  describe 'crafts' do
    before do
      crafting_tool = create(:crafting_tool, parent_inventory: user.child_inventory)
      user.equip_item(crafting_tool)
      @new_item     = crafting_tool.craft(
        described_class,
        [
          create(:gatherable_companion, stack_amount: 1, parent_inventory: user.child_inventory),
          create(:gatherable_fish, stack_amount: 10, parent_inventory: user.child_inventory)
        ]
      )
    end

    it 'creates the item' do
      expect(@new_item.id).not_to be_nil
    end
  end

  it 'has an inventory' do
    pet = create(:crafted_pet)

    expect(pet.child_inventory).not_to be_nil
  end
end
