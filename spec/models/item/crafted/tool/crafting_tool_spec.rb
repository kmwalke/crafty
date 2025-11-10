require 'rails_helper'

RSpec.describe Item::Crafted::Tool::CraftingTool do
  let(:user) { create(:user) }

  before do
    user.equip_item(create(:crafting_tool, parent_inventory: user.inventory))
  end

  it 'lists actions' do
    expect(user.tool.actions).to eq(%w[craft recipes])
  end

  it 'doesn\'t update if user has low energy' do
    user.update(energy: 0)

    expect { user.tool.craft(Item::Crafted::Ingot, ingredients: [create(:gatherable_ore)]) }.to raise_error(CraftyError)
  end

  describe 'crafts' do
    let!(:ingredients) do
      [
        create(:gatherable_ore, parent_inventory: user.inventory, name: 'Copper', level: Level::LEGENDARY),
        create(:gatherable_ore, parent_inventory: user.inventory, name: 'Iron', level: Level::COMMON)
      ]
    end
    let!(:old_inv) { user.inventory.items.count }

    before do
      user.tool.craft(Item::Crafted::Ingot, ingredients)
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
      ingredients.each do |ingredient|
        expect(Item.find_by(id: ingredient.id)).to be_nil
      end
    end
  end

  describe 'crafts with stacked items' do
    let!(:ingredients) do
      [
        create(:gatherable_ore, parent_inventory: user.inventory, stack_amount: 3)
      ]
    end

    before do
      user.tool.craft(Item::Crafted::Ingot, ingredients)
    end

    it 'creates the new item' do
      expect(user.inventory.items.last).to be_a ItemType::CRAFTED[:ingot].constantize
    end

    it 'consumes the stack' do
      expect(ingredients[0].stack_amount).to eq(1)
    end
  end

  describe 'crafts with a mix of stacked and unstacked items' do
    let!(:ingredients) do
      [
        create(:gatherable_fruit, parent_inventory: user.inventory, stack_amount: 2, name: 'Apple'),
        create(:gatherable_fruit, parent_inventory: user.inventory, stack_amount: 1, name: 'Apple')
      ]
    end

    before do
      user.tool.craft(Item::Crafted::Salad, ingredients)
    end

    it 'creates the new item' do
      expect(user.inventory.items.last).to be_a ItemType::CRAFTED[:salad].constantize
    end

    it 'names the new item' do
      expect(user.inventory.items.last.name).to eq('Apple')
    end

    it 'consumes the ingredients' do
      ingredients.each do |ingredient|
        expect(Item.find_by(id: ingredient.id)).to be_nil
      end
    end
  end

  it 'doesnt craft with bad recipe' do
    expect do
      user.tool.craft(
        Item::Crafted::Ingot,
        [
          create(:gatherable_fruit, parent_inventory: user.inventory),
          create(:gatherable_ore, parent_inventory: user.inventory)
        ]
      )
    end.to raise_error CraftyError
  end

  it 'lists recipes' do
    expect(user.tool.recipes).to be_a(Array)
  end
end
