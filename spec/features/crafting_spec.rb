require 'rails_helper'

RSpec.describe 'Crafting' do
  let!(:player) { login }
  let!(:crafting_tool) { create(:crafting_tool, parent_inventory: player.inventory) }

  before do
    player.equip_item(crafting_tool)
    visit game_path
  end

  describe 'crafts an item' do
    describe 'creates the item from a stack' do
      let!(:fruit_4stack) { build(:gatherable_fruit, parent_inventory: nil, stack_amount: 4) }

      before do
        player.add_item(fruit_4stack)
        visit game_path

        within 'div.actions' do
          click_link 'Craft'
        end

        within '.craft-popup' do
          select ItemType::CRAFTED[:salad], from: 'recipe_item_type'
          check fruit_4stack.full_name

          click_button 'Craft Item'
        end
      end

      it 'creates the item' do
        expect(page).to have_css(
          'div.inventory li span',
          text: player.inventory.items.find_by(type: ItemType::CRAFTED[:salad]).name
        )
      end
    end

    describe 'creates the item from multiple items' do
      let(:ore1) { build(:gatherable_ore, parent_inventory: nil) }
      let(:ore2) { build(:gatherable_ore, parent_inventory: nil) }

      before do
        player.add_item(ore1)
        player.add_item(ore2)
        visit game_path

        within 'div.actions' do
          click_link 'Craft'
        end

        within '.craft-popup' do
          select ItemType::CRAFTED[:ingot], from: 'recipe_item_type'
          check ore1.full_name
          check ore2.full_name

          click_button 'Craft Item'
        end
      end

      it 'creates the item' do
        expect(page).to have_css(
          'div.inventory li span',
          text: player.inventory.items.find_by(type: ItemType::CRAFTED[:ingot]).name
        )
      end
    end
  end
end
