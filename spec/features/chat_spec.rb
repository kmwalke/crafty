require 'rails_helper'

RSpec.describe 'Chat' do
  describe 'logged in' do
    let!(:player) { create(:user) }

    before do
      login_as player
    end

    it 'views local chat' do
      chat = create(:chat, location: player.location)
      visit game_path

      within '.chatbox' do
        expect(page).to have_content(chat.content)
      end
    end

    it 'doesnt view distant chat' do
      chat = create(:chat)
      visit game_path

      within '.chatbox' do
        expect(page).to have_no_content(chat.content)
      end
    end

    it 'sends a chat' do
      fill_in 'chat-content', with: 'chat message'
      click_button 'Send'

      within '.chatbox' do
        expect(page).to have_content('chat message')
      end
    end
  end
end
