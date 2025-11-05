require 'rails_helper'

RSpec.describe Item::Craftable::Tool::CraftingTool do
  let(:user) { create(:user) }
  let(:crafting_tool) { create(:crafting_tool, inventory: user.inventory) }
  let!(:bad_crafting_params) do
    {
      item_type: ItemType::CRAFTABLE[:ingot],
      item_ids: [
        create(:gatherable_fruit, inventory: user.inventory).id,
        create(:gatherable_ore, inventory: user.inventory).id
      ]
    }
  end
  let!(:crafting_params) do
    {
      item_type: ItemType::CRAFTABLE[:ingot],
      item_ids: [
        create(:gatherable_ore, inventory: user.inventory).id,
        create(:gatherable_ore, inventory: user.inventory).id
      ]
    }
  end
  let!(:stacked_crafting_params) do
    {
      item_type: ItemType::CRAFTABLE[:ingot],
      item_ids: [
        create(:gatherable_ore, inventory: user.inventory, stack_amount: 3).id
      ]
    }
  end
  let!(:mixed_crafting_params) do
    {
      item_type: ItemType::CRAFTABLE[:salad],
      item_ids: [
        create(:gatherable_fruit, inventory: user.inventory, stack_amount: 2).id,
        create(:gatherable_fruit, inventory: user.inventory, stack_amount: 1).id
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
    name = crafted_ore_name
    level = Item.find(crafting_params[:item_ids][0]).level
    crafting_tool.craft(crafting_params)
    expect(user.inventory.items.count).to eq(old_inv - 1)
    expect(user.inventory.items.last).to be_a ItemType::CRAFTABLE[:ingot].constantize
    expect(user.inventory.items.last.name).to eq(name)
    expect(user.inventory.items.last.level).to eq(level)
    crafting_params[:item_ids].each do |id|
      expect(Item.find_by(id:)).to be_nil
    end
  end

  it 'crafts with stacked items' do
    crafting_tool.craft(stacked_crafting_params)

    expect(user.inventory.items.last).to be_a ItemType::CRAFTABLE[:ingot].constantize
    ingredient = Item.find(stacked_crafting_params[:item_ids][0])
    expect(ingredient.stack_amount).to eq(1)
    expect(user.inventory.items.last.name).to eq(ingredient.name)
  end

  it 'crafts with a mix of stacked and unstacked items' do
    crafting_tool.craft(mixed_crafting_params)

    expect(user.inventory.items.last).to be_a ItemType::CRAFTABLE[:salad].constantize

    mixed_crafting_params[:item_ids].each do |id|
      expect(Item.find_by(id:)).to be_nil
    end
  end

  it 'doesnt craft with bad recipe' do
    expect { crafting_tool.craft(bad_crafting_params) }.to raise_error CraftyError
  end
end

def crafted_ore_name
  crafting_params[:item_ids].map do |id|
    Item.find(id).name
  end.join(' ')
end
