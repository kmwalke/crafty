require 'rails_helper'

RSpec.describe 'Game' do
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

    it 'displays the homepage' do
      visit game_path

      expect(page).to have_content('Crafty')
    end
  end
end
