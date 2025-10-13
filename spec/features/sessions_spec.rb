require 'rails_helper'

RSpec.describe 'Sessions' do
  describe 'logged out' do
    it 'redirects to login page' do
      visit game_path
      expect(page).to have_current_path(login_path, ignore_query: true)
    end
  end

  describe 'logged in' do
    before do
      login
    end

    it 'logs in' do
      expect(page).to have_content('Log Out')
    end

    it 'logs out' do
      logout
      expect(page).to have_current_path(root_path, ignore_query: true)
    end
  end
end
