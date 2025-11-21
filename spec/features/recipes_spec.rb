require 'rails_helper'

RSpec.describe 'Recipes' do
  let!(:player) { login }
  let!(:crafting_tool) { create(:crafting_tool, parent_inventory: player.child_inventory) }

  before do
    player.equip_item(crafting_tool)
    visit game_path
    within 'div.actions' do
      click_link 'Recipes'
    end
  end

  it 'shows the recipes' do
    ItemType::CRAFTED.each_value do |item|
      within '.recipes-popup' do
        item.constantize.new.recipe.each do |ingredient, amount|
          expect(page).to have_content("#{amount}x #{pretty_type(ingredient)}")
        end
      end
    end
  end
end
