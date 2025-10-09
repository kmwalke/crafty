require 'rails_helper'

RSpec.describe 'Traveling' do
  describe 'logged out' do
    it 'redirects to login page' do
      visit game_path
      expect(page).to have_current_path(login_path, ignore_query: true)
    end
  end

  describe 'logged in' do
    before do
      login
      visit game_path
    end

    it 'shows location details' do
      # either show all location details or click for a popup div
      expect(true).to be false
    end

    it 'travels between locations' do
      # travel to a new location
      expect(true).to be false
    end

    it 'shows the map' do
      # click "map" to see a list of locations
      # In the future, an actual map, using the x,y coors and a background satellite image
      expect(true).to be false
    end
  end
end
