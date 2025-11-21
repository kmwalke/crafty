require 'rails_helper'

RSpec.describe Item::Crafted::Vehicle::HoverBike do
  let(:user) { create(:user) }

  describe 'crafts' do
    let(:frame) { create(:crafted_frame, stack_amount: 1, parent_inventory: user.child_inventory) }

    before do
      crafting_tool = create(:crafting_tool, parent_inventory: user.child_inventory)
      user.equip_item(crafting_tool)
      @new_item     = crafting_tool.craft(
        described_class,
        [
          frame,
          create(:crafted_component, stack_amount: 30, parent_inventory: user.child_inventory),
          create(:crafted_plastic, stack_amount: 10, parent_inventory: user.child_inventory)
        ]
      )
    end

    it 'creates the item' do
      expect(@new_item.id).not_to be_nil
    end

    it 'names the item' do
      expect(@new_item.name).to eq(frame.name)
    end
  end

  it 'has an inventory' do
    hover_bike = create(:vehicle_hover_bike)

    expect(hover_bike.child_inventory).not_to be_nil
  end

  it 'has a low level inventory' do
    hover_bike = create(:vehicle_hover_bike, level: Level::COMMON)

    expect(hover_bike.child_inventory.size).to eq(10)
  end

  it 'has a high level inventory' do
    hover_bike = create(:vehicle_hover_bike, level: Level::LEGENDARY)

    expect(hover_bike.child_inventory.size).to eq(50)
  end
end
