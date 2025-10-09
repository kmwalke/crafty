require 'rails_helper'

RSpec.describe 'Sessions' do
  describe 'logged out' do
    it 'redirects to login page' do
      visit game_path
      expect(page).to have_current_path(login_path, ignore_query: true)
    end

    it 'redirects to requested admin page', skip: 'admins not implemented' do
      visit game_path
      login_as_admin
      expect(page).to have_current_path(admin_users_path, ignore_query: true)
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
