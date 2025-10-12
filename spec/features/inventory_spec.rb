require 'rails_helper'

RSpec.describe 'Inventory' do
  describe 'logged in' do
    let!(:current_user) { login }

    before do
      5.times.map { create(:item, inventory: current_user.inventory) }
      visit game_path
    end

    it 'shows the inventory items' do
      # current_user.inventory.items.each do |item|
      expect(page).to have_css("fieldset.inventory ul li #{current_user.inventory.items.last.name}")
      # end
    end
  end
end
