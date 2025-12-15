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
      player.location.add_building(build(:crafted_building, parent_inventory: nil))
      create(:resource, location: player.location)

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
    end

    it 'has buildings section' do
      expect(page).to have_content('Buildings')
    end

    it 'has resource section' do
      expect(page).to have_content('Resources')
    end

    it 'has inventory section' do
      expect(page).to have_content('Inventory')
    end

    it 'displays actions' do
      player.equip_item(create(:vehicle_hover_bike, parent_inventory: player.child_inventory))

      visit game_path

      player.actions.each do |action|
        expect(page).to have_content(action.capitalize)
      end
    end

    it 'cheats to recharge energy' do
      player.update(energy: 0)

      click_link 'Drink a Monster Energy'

      expect(player.reload.energy).to eq(User::MAX_ENERGY)
    end

    describe 'displays equipment' do
      let!(:vehicle) { create(:vehicle_hover_bike, parent_inventory: player.child_inventory) }

      it 'shows the vehicle' do
        player.equip_item(vehicle)

        visit game_path

        expect(page).to have_content("Vehicle: #{vehicle.name}")
      end

      it 'doesnt show vehicle if not equiped' do
        expect(page).to have_no_content("Vehicle: #{vehicle.name}")
      end
    end
  end
end
