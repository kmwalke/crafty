require 'rails_helper'

RSpec.describe Item::Crafted::Building do
  let(:user) { create(:user) }

  describe 'crafts' do
    before do
      crafting_tool = create(:crafting_tool, parent_inventory: user.inventory)
      user.equip_item(crafting_tool)
      @new_item     = crafting_tool.craft(
        described_class,
        [
          create(:crafted_plank, stack_amount: 10, parent_inventory: user.inventory),
          create(:crafted_beam, stack_amount: 3, parent_inventory: user.inventory),
          create(:crafted_screw, stack_amount: 400, parent_inventory: user.inventory)
        ]
      )
    end

    it 'crafts the item' do
      expect(@new_item.id).not_to be_nil
    end
  end

  describe 'places the building' do
    let(:building) { create(:crafted_building, parent_inventory: user.inventory) }

    before do
      building.use
    end

    it 'removes the building' do
      expect(user.carried_items.include?(building)).to be false
    end

    it 'add the building' do
      expect(user.location.property.include?(building)).to be true
    end
  end
end
