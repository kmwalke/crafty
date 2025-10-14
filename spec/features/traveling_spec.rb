require 'rails_helper'

RSpec.describe 'Traveling' do
  let!(:player) { login }
  let!(:location1) { player.location }
  let!(:location2) { create(:location) }
  let!(:location3) { create(:location) }

  before do
    player.equip_item(create(:vehicle, inventory: player.inventory))
    visit game_path
  end

  it 'travels between locations' do
    click_link 'Travel'
    click_link location2.name

    expect(player.reload.location).to eq(location2)
  end

  describe 'shows the map' do
    let!(:locations) { [location1, location2, location3] }

    it 'shows valid travel locations' do
      locations.each do |location|
        expect(page).to have_content(location.name)
      end
    end

    pending 'doesnt show distant locations'
  end
end
