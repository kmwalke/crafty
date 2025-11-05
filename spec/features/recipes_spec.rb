require 'rails_helper'

RSpec.describe 'Recipes' do
  let!(:player) { login }
  let!(:crafting_tool) { create(:crafting_tool, inventory: player.inventory) }

  before do
    player.equip_item(crafting_tool)
    visit game_path
    within 'div.actions' do
      click_link 'Recipes'
    end
  end

  it 'shows the recipes' do
    within '.recipes-popup' do
      ItemType::CRAFTABLE.each_value do |item|
        item.constantize.new.recipe.each { |ingredient| expect(page).to have_content(pretty_type(ingredient)) }
      end
    end
  end
end
