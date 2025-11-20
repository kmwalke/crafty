require 'rails_helper'

RSpec.describe 'Mount' do
  let!(:player) { login }
  let!(:fish) { create(:gatherable_fish, parent_inventory: player.inventory) }
  let!(:mount) { create(:vehicle_mount, parent_inventory: player.inventory) }

  before do
    visit game_path
    click_link mount.name
    click_link 'Equip'
  end

  describe 'feeds the mount' do
    before do
      within 'div.actions' do
        click_link 'Feed'
        click_link fish.full_name
      end
    end

    it 'boosts' do
      within 'div.equipment' do
        expect(page).to have_content("#{mount.full_name} (Happy)")
      end
    end

    it 'gets travel bonus' do
      within 'div.actions' do

        expect(page).to have_content('Happy Mount Bonus')
      end
    end
  end
end
