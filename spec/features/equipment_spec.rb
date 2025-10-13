require 'rails_helper'

RSpec.describe 'Equipment' do
  let!(:current_user) { login }
  let!(:vehicle) { create(:vehicle, inventory: current_user.inventory) }

  before do
    visit game_path
  end

  describe 'vehicle' do
    before do
      click_link vehicle.name
      click_link 'Equip'
    end

    it 'equips the vehicle' do
      expect(current_user.reload.vehicle).to eq(vehicle)
    end

    it 'displays equipped vehicle' do
      expect(page).to have_content("Vehicle: #{vehicle.name}")
    end

    pending 'unequips a vehicle'
  end
end
