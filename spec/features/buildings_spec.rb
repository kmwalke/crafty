require 'rails_helper'

RSpec.describe 'Buildings' do
  let!(:player) { login }
  let!(:building) do
    player.location.add_building(build(:crafted_building, name: 'building name', parent_inventory: nil))
  end
  let!(:distant_building) do
    create(:location).add_building(build(:crafted_building, name: 'distant building', parent_inventory: nil))
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

  pending 'places a building'
  # building = create(:crafted_building)
  # player.inventory.add_item(building)
  #
  # within 'inventory' do
  #   click_link building.name
  #   click_link 'Place Building'
  # end
  #
  # within 'buildings' do
  #   expect(page).to have_content(building.name)
  # end
end
