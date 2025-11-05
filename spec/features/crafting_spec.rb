require 'rails_helper'

RSpec.describe 'Crafting' do
  let!(:player) { login }
  let!(:crafting_tool) { create(:crafting_tool, inventory: player.inventory) }

  before do
    player.equip_item(crafting_tool)
    visit game_path
  end

  describe 'crafts an item' do
    let!(:fruit_4stack) { build(:gatherable_fruit, inventory: nil, stack_amount: 4) }

    pending 'select the color of the item'
    # select the color of the item, if level high enough
    # <input type="color" />

    it 'creates the item from a stack' do
      player.inventory.add_item(fruit_4stack)
      visit game_path
      old_inv_count = player.inventory.items.count

      within 'div.actions' do
        click_link 'Craft'
      end

      within '.craft-popup' do
        select ItemType::CRAFTABLE[:salad], from: 'recipe_item_type'
        check fruit_4stack.full_name

        click_button 'Craft Item'
      end

      expect(fruit_4stack.stack_amount).to eq(1)
      expect(player.inventory.items.count).to eq(old_inv_count + 1)
      expect(player.inventory.items.where(type: ItemType::CRAFTABLE[:salad]).count).to eq(1)
    end

    it 'creates the item from multiple items' do
      ore1          = build(:gatherable_ore, inventory: nil)
      ore2          = build(:gatherable_ore, inventory: nil)
      player.inventory.add_item(ore1)
      player.inventory.add_item(ore2)
      visit game_path
      old_inv_count = player.inventory.items.count

      within 'div.actions' do
        click_link 'Craft'
      end

      within '.craft-popup' do
        select ItemType::CRAFTABLE[:ingot], from: 'recipe_item_type'
        check ore1.full_name
        check ore2.full_name

        click_button 'Craft Item'
      end

      expect(player.inventory.items.count).to eq(old_inv_count - 1)
      expect(player.inventory.items.where(type: ItemType::CRAFTABLE[:ingot]).count).to eq(1)
    end
  end
end
