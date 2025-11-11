require 'rails_helper'

RSpec.describe 'Users' do
  let!(:player) { create(:user) }

  describe 'logged out' do
    it 'redirects to login page' do
      visit edit_user_path(player)
      expect(page).to have_current_path(login_path, ignore_query: true)
    end
  end

  describe 'logged in' do
    before do
      login_as player
      visit game_path
      click_link 'game-menu-button'
      click_link 'Settings'
    end

    it 'views the player settings' do
      expect(page).to have_current_path(edit_user_path(player))
    end

    it 'doesnt view other players settings' do
      player2 = create(:user)
      visit edit_user_path(player2)

      expect(page).to have_current_path(game_path)
    end

    it 'changes the player name' do
      fill_in 'Name', with: 'new name'
      click_button 'Update User'

      expect(player.reload.name).to eq('new name')
    end

    it 'changes the player email' do
      fill_in 'Email', with: 'newemail@place.com'
      click_button 'Update User'

      expect(player.reload.email).to eq('newemail@place.com')
    end

    it 'changes the player password' do
      digest = player.password_digest
      fill_in 'Password', with: 'newpass'
      fill_in 'user_password_confirmation', with: 'newpass'
      click_button 'Update User'

      expect(player.reload.password_digest).not_to eq(digest)
    end
  end
end
