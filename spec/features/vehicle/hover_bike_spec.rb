require 'rails_helper'

RSpec.describe 'Hover Bike' do
  let!(:player) { login }
  let!(:bike) { create(:vehicle_hover_bike, parent_inventory: player.child_inventory) }
  let!(:item) { create(:gatherable_fruit, parent_inventory: bike.child_inventory) }

  before do
    visit game_path
    click_link bike.name
    click_link 'Equip'
  end

  it 'shows the vehicle inventory' do
    within 'div.inventory' do
      expect(page).to have_content("#{bike.full_name} Inventory")
    end
  end

  it 'shows the items in vehicle inventory' do
    within 'div.vehicle-inventory' do
      expect(page).to have_content(item.full_name)
    end
  end
end
