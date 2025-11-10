require 'rails_helper'

RSpec.describe Item::Crafted::Vehicle::HoverBike do
  let(:user) { create(:user) }

  it 'crafts' do
    crafting_tool = create(:crafting_tool, parent_inventory: user.inventory)
    user.equip_item(crafting_tool)
    new_item      = crafting_tool.craft(
      described_class,
      [
        create(:crafted_frame, stack_amount: 1, parent_inventory: user.inventory),
        create(:crafted_component, stack_amount: 30, parent_inventory: user.inventory),
        create(:crafted_plastic, stack_amount: 10, parent_inventory: user.inventory)
      ]
    )

    expect(new_item.id).not_to be_nil
  end

  pending 'does something mounts cant do'
  # flies over water or mountains?
end
