require 'rails_helper'

RSpec.describe 'Vehicle' do
  let!(:player) { login }
  let!(:vehicle) { create(:craftable_vehicle, inventory: player.inventory) }

  before do
    visit game_path
    click_link vehicle.name
    click_link 'Equip'
  end

  it 'equips the vehicle' do
    expect(player.reload.vehicle).to eq(vehicle)
  end

  it 'displays equipped vehicle' do
    expect(page).to have_content("Vehicle: #{vehicle.name}")
  end

  it 'unequips a vehicle' do
    find_by_id('unequip_vehicle').click

    expect(player.reload.vehicle).to be_nil
  end
end
