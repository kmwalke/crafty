require 'rails_helper'

RSpec.describe 'Game' do
  describe 'logged out' do
    it 'redirects to login page' do
      visit game_path
      expect(page).to have_current_path(login_path, ignore_query: true)
    end
  end

  describe 'logged in' do
    let!(:player) { create(:user) }

    before do
      login_as player
      visit game_path
    end

    it 'displays the homepage' do
      expect(page).to have_current_path(game_path)
    end

    describe 'location' do
      it 'shows location name' do
        expect(page).to have_content(player.location.name)
      end

      it 'shows other players in the location' do
        players = 2.times.map { create(:user, location: player.location) }

        visit game_path

        players.each do |p|
          expect(page).to have_content(p.name)
        end
      end

      it 'doesnt list players in other areas' do
        distant_player = create(:user)

        visit game_path

        expect(page).to have_no_content(distant_player.name)
      end
    end

    describe 'user info' do
      it 'displays player name' do
        expect(page).to have_content(player.name)
      end

      it 'displays energy' do
        expect(page).to have_content("Energy: #{player.energy}")
      end

      it 'displays status' do
        expect(page).to have_content("Status: #{player.status}")
      end
    end

    it 'has inventory section' do
      expect(page).to have_content('Inventory')
    end

    it 'displays actions' do
      player.equip_vehicle(create(:vehicle, inventory: player.inventory))

      visit game_path

      player.actions.each do |action|
        expect(page).to have_content(action.capitalize)
      end
    end

    describe 'displays equipment' do
      let!(:vehicle) { create(:vehicle, inventory: player.inventory) }

      it 'shows the vehicle' do
        player.equip_vehicle(vehicle)

        visit game_path

        expect(page).to have_content("Vehicle: #{vehicle.name}")
      end

      it 'doesnt show vehicle if not equiped' do
        expect(page).to have_no_content("Vehicle: #{vehicle.name}")
      end
    end
  end
end
