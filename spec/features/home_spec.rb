require 'rails_helper'

RSpec.describe 'Home' do
  it 'displays the homepage' do
    visit root_path

    expect(page).to have_content('Crafty')
  end
end
