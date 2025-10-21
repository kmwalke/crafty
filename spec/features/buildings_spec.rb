require 'rails_helper'

RSpec.describe 'Buildings' do
  let!(:player) { login }
  let!(:building) { player.location.add_building(build(:craftable_building, name: 'building name', inventory: nil)) }
  let!(:distant_building) do
    create(:location).add_building(build(:craftable_building, name: 'distant building', inventory: nil))
  end

  before do
    visit game_path
  end

  it 'sees buildings' do
    expect(page).to have_css('div.buildings a', text: building.name)
  end

  it 'does not see distant buildings' do
    expect(page).to have_no_content(distant_building.name)
  end

  it 'enters a building' do
    click_link building.name
    expect(page).to have_css("div#building-#{building.id} h4", text: building.name)
  end
end
