require 'rails_helper'

RSpec.describe Item::Craftable::Tool::CraftingTool do
  let(:user) { create(:user) }
  let(:crafting_tool) { create(:crafting_tool, inventory: user.inventory) }
  let(:crafting_params) do
    {
      item_type: ItemType::CRAFTABLE[:ingot],
      item_ids: [
        create(:gatherable_ore, inventory: user.inventory).id,
        create(:gatherable_ore, inventory: user.inventory).id
      ]
    }
  end

  before do
    user.equip_item(crafting_tool)
  end

  it 'lists actions' do
    expect(crafting_tool.actions).to eq(%w[craft])
  end

  it 'doesn\'t update if user has low energy' do
    user.update(energy: 0)

    expect { crafting_tool.craft(crafting_params) }.to raise_error(CraftyError)
  end

  it 'crafts' do
    item_count = user.inventory.items.count
    crafting_tool.craft(crafting_params)
    expect(user.inventory.items.count == item_count + 1).to be true
  end
end
