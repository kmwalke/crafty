require 'rails_helper'

RSpec.describe 'Skills' do
  before do
    login
    visit game_path
  end

  it 'shows the skills' do
    within 'div.skills' do
      Skills::NAMES.each do |skill|
        expect(page).to have_content("#{skill}: ")
      end
    end
  end
end
