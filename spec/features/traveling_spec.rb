require 'rails_helper'

RSpec.describe 'Traveling' do
  let!(:player) { login }
  let!(:location2) { create(:location) }
  let!(:location3) { create(:location) }

  before do
    player.equip_item(create(:craftable_vehicle, inventory: player.inventory))
    visit game_path
  end

  it 'travels between locations' do
    click_link 'Travel'
    click_link location2.name

    expect(player.reload.location).to eq(location2)
  end

  describe 'shows the map' do
    let!(:locations) { [location2, location3] }

    it 'shows valid travel locations' do
      locations.each do |location|
        expect(page).to have_content(location.name)
      end
    end

    it 'shows the distance to location' do
      within 'table.locations' do
        expect(page).to have_content("#{player.location.distance_from(locations[0])} km")
      end
    end

    it 'shows the energy usage to the location' do
      within 'table.locations' do
        expect(page).to have_content(player.vehicle.energy_usage(player.location, locations[0]))
      end
    end
  end
end
