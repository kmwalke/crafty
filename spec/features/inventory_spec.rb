require 'rails_helper'

RSpec.describe 'Inventory' do
  describe 'logged in' do
    let!(:current_user) { login }

    before do
      5.times.map { create(:item, inventory: current_user.inventory) }
      visit game_path
    end

    it 'shows the inventory items' do
      current_user.inventory.items.each do |item|
        expect(page).to have_css('fieldset.inventory ul li', text: item.name)
      end
    end

    pending 'shows remaining inventory space'

    describe 'details on click' do
      let(:item) { current_user.inventory.items.last }

      before do
        click_link item.name
      end

      it 'shows description' do
        expect(page).to have_css('div.popup p', text: item.description)
      end

      it 'shows level' do
        expect(page).to have_css('div.popup span', text: item.level)
      end

      it 'shows created by' do
        expect(page).to have_css('div.popup span', text: item.created_by.name)
      end
    end
  end
end
