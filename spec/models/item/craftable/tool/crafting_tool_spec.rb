require 'rails_helper'

RSpec.describe Item::Craftable::Tool::CraftingTool do
  let(:user) { create(:user) }
  let(:crafting_tool) { create(:crafting_tool, inventory: user.inventory) }
  let(:bad_crafting_params) do
    {
      item_type: ItemType::CRAFTABLE[:ingot],
      item_ids: [
        create(:gatherable_ore, inventory: user.inventory).id,
        create(:gatherable_fruit, inventory: user.inventory).id,
        create(:gatherable_ore, inventory: user.inventory).id
      ]
    }
  end
  let(:crafting_params) do
    {
      item_type: ItemType::CRAFTABLE[:ingot],
      item_ids: [
        create(:gatherable_ore, inventory: user.inventory).id,
        create(:gatherable_ore, inventory: user.inventory).id
      ]
    }
  end
  let(:stacked_crafting_params) do
    {
      item_type: ItemType::CRAFTABLE[:ingot],
      item_ids: [
        create(:gatherable_ore, inventory: user.inventory, stack_amount: 3).id
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
    old_inv = user.inventory.items.count
    crafting_tool.craft(crafting_params)
    expect(user.inventory.items.last).to be_a ItemType::CRAFTABLE[:ingot].constantize
    expect(user.inventory.items.last.name).to eq('some combination of ore names')
    expect(user.inventory.items.last.name).to eq('combine the names. craft copper and iron, you just made a "copper iron ingot".  combine apple and pear, you just made "apple Pear salad" combine copper and copper, just "copper ingot"')
    expect(user.inventory.items.last.name).to eq('this has to be a method in the crafted item class.  Ingot.craft and Salad.craft has to do all this work.  Each item will do this logic differently')
    expect(user.inventory.items.count).to eq(old_inv - 1)
    crafting_params[:item_ids].each do |id|
      expect(Item.find_by(id:)).to be_nil
    end
  end

  it 'crafts with stacked items' do
    crafting_tool.craft(stacked_crafting_params)
    expect(Item.find_by(id: stacked_crafting_params).stack_amount).to eq(1)
  end

  it 'doesnt craft with bad recipe' do
    expect { crafting_tool.craft(bad_crafting_params) }.to raise_error CraftyError, message: ErrorMessage::CRAFTING[:failed]
  end
end
