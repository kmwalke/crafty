require 'rails_helper'

RSpec.describe Item::Crafted::Vehicle::Mount do
  let(:user) { create(:user) }

  it 'crafts' do
    crafting_tool = create(:crafting_tool, parent_inventory: user.inventory)
    user.equip_item(crafting_tool)
    new_item      = crafting_tool.craft(
      described_class,
      [
        create(:gatherable_companion, stack_amount: 1, parent_inventory: user.inventory),
        create(:crafted_harness, stack_amount: 1, parent_inventory: user.inventory),
        create(:gatherable_fish, stack_amount: 10, parent_inventory: user.inventory)
      ]
    )

    expect(new_item.id).not_to be_nil
  end

  pending 'feeds the mount'
  # feeding a mount gives some boost
  # maybe requires lees/no energy for a while
end
