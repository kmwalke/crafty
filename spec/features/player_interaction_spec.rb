require 'rails_helper'

RSpec.describe 'PlayerInteraction' do
  let!(:player) { login }
  let!(:player2) { create(:user, location: player.location) }

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

  describe 'shows the player details' do
    before do
      visit game_path

      click_link player2.name
    end

    it 'name' do
      expect(page).to have_css("div.popup#player-#{player2.id}-details h4", text: player2.name)
    end

    it 'status' do
      expect(page).to have_css("div.popup#player-#{player2.id}-details span", text: "Status: #{player2.status}")
    end
  end
end
