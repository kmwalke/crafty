require 'rails_helper'

RSpec.describe 'Hover Bike' do
  let!(:player) { login }
  let!(:mount) { create(:vehicle_mount, parent_inventory: player.inventory) }

  before do
    visit game_path
    click_link mount.name
    click_link 'Equip'
  end

  describe 'feeds the mount' do
    before do
      within 'div.actions' do
        click_link "Feed #{mount.name}"
      end
    end

    it 'boosts' do
      within 'div.equipment' do
        expect(page).to have_content("#{mount.full_name} (Well Fed)")
      end
    end

    it 'gets travel bonus' do
      within 'div.actions' do
        expect(page).to have_content('Well Fed bonus')
      end
    end
  end
end
