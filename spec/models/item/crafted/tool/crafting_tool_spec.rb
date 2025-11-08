require 'rails_helper'

RSpec.describe Item::Crafted::Tool::CraftingTool do
  let(:user) { create(:user) }

  before do
    user.equip_item(create(:crafting_tool, parent_inventory: user.inventory))
  end

  it 'lists actions' do
    expect(user.crafting_tool.actions).to eq(%w[craft recipes])
  end

  it 'doesn\'t update if user has low energy' do
    user.update(energy: 0)

    expect { user.crafting_tool.craft({ item_ids: [] }) }.to raise_error(CraftyError)
  end

  describe 'crafts' do
    let!(:crafting_params) do
      {
        item_type: ItemType::CRAFTED[:ingot],
        item_ids: [
          create(:gatherable_ore, parent_inventory: user.inventory, name: 'Copper', level: Level::LEGENDARY).id,
          create(:gatherable_ore, parent_inventory: user.inventory, name: 'Iron', level: Level::COMMON).id
        ]
      }
    end
    let!(:old_inv) { user.inventory.items.count }

    before do
      user.crafting_tool.craft(crafting_params)
    end

    it 'adjusts the inventory' do
      expect(user.inventory.items.count).to eq(old_inv - 1)
    end

    it 'creates the new item' do
      expect(user.inventory.items.last).to be_a ItemType::CRAFTED[:ingot].constantize
    end

    it 'names the new item' do
      expect(user.inventory.items.last.name).to eq('Copper Iron')
    end

    it 'gives the new item a level' do
      expect(user.inventory.items.last.level).to eq(Level::COMMON)
    end

    it 'consumes the ingredients' do
      crafting_params[:item_ids].each do |id|
        expect(Item.find_by(id:)).to be_nil
      end
    end
  end

  describe 'crafts with stacked items' do
    let!(:stacked_crafting_params) do
      {
        item_type: ItemType::CRAFTED[:ingot],
        item_ids: [
          create(:gatherable_ore, parent_inventory: user.inventory, stack_amount: 3).id
        ]
      }
    end

    before do
      user.crafting_tool.craft(stacked_crafting_params)
    end

    it 'creates the new item' do
      expect(user.inventory.items.last).to be_a ItemType::CRAFTED[:ingot].constantize
    end

    it 'consumes the stack' do
      ingredient = Item.find(stacked_crafting_params[:item_ids][0])
      expect(ingredient.stack_amount).to eq(1)
    end
  end

  describe 'crafts with a mix of stacked and unstacked items' do
    let!(:mixed_crafting_params) do
      {
        item_type: ItemType::CRAFTED[:salad],
        item_ids: [
          create(:gatherable_fruit, parent_inventory: user.inventory, stack_amount: 2, name: 'Apple').id,
          create(:gatherable_fruit, parent_inventory: user.inventory, stack_amount: 1, name: 'Apple').id
        ]
      }
    end

    before do
      user.crafting_tool.craft(mixed_crafting_params)
    end

    it 'creates the new item' do
      expect(user.inventory.items.last).to be_a ItemType::CRAFTED[:salad].constantize
    end

    it 'names the new item' do
      expect(user.inventory.items.last.name).to eq('Apple')
    end

    it 'consumes the ingredients' do
      mixed_crafting_params[:item_ids].each do |id|
        expect(Item.find_by(id:)).to be_nil
      end
    end
  end

  it 'doesnt craft with bad recipe' do
    expect do
      user.crafting_tool.craft(
        {
          item_type: ItemType::CRAFTED[:ingot], item_ids: [
            create(:gatherable_fruit, parent_inventory: user.inventory).id,
            create(:gatherable_ore, parent_inventory: user.inventory).id
          ]
        }
      )
    end.to raise_error CraftyError
  end

  it 'lists recipes' do
    expect(user.crafting_tool.recipes).to be_a(Array)
  end
end
