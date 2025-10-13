require 'rails_helper'

RSpec.describe 'Home' do
  it 'displays the homepage' do
    visit root_path

    expect(page).to have_content('Crafty')
  end

  it 'redirects to game page when logged in' do
    login

    visit root_path

    expect(page).to have_current_path(game_path)
  end
end
