require 'rails_helper'

RSpec.describe 'Traveling' do
  describe 'logged in' do
    let!(:current_user) { login }
    let!(:location1) { current_user.location }
    let!(:location2) { create(:location) }
    let!(:location3) { create(:location) }

    before do
      current_user.equip_vehicle(create(:vehicle, inventory: current_user.inventory))
      visit game_path
    end

    it 'travels between locations' do
      click_link 'Travel'
      click_link location2.name

      expect(current_user.reload.location).to eq(location2)
    end

    describe 'shows the map' do
      # In the future, an actual map, using the x,y coors and a background satellite image
      let!(:locations) { [location1, location2, location3] }

      it 'shows valid travel locations' do
        locations.each do |location|
          expect(page).to have_content(location.name)
        end
      end

      pending 'doesnt show distant locations'
    end
  end
end
