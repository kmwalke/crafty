require 'rails_helper'

RSpec.describe 'Recipes' do
  let!(:player) { login }
  let!(:crafting_tool) { create(:crafting_tool, inventory: player.inventory) }

  before do
    player.equip_item(crafting_tool)
    visit game_path
    # within 'div.actions' do
    #   click_link 'Recipes'
    # end
  end

  it 'shows the recipes' do
    # within '.craft-popup' do
    ItemType::CRAFTABLE.each_value do |item|
      expect(page).to have_content(item.constantize.new.recipe)
    end
    # end
  end
end
