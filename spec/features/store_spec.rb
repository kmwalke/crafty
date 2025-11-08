require 'rails_helper'

RSpec.describe 'Store' do
  let!(:player) { create(:user) }
  let!(:building) { build(:crafted_building, parent_inventory: nil) }
  let!(:item) { player.inventory.add_item(build(:gatherable_fruit, parent_inventory: nil)) }

  before do
    player.location.add_building(building)
    building.child_inventory.add_item(build(:gatherable_ore, parent_inventory: nil))

    login_as player
    visit game_path
    click_link building.name
  end

  it 'building section of homepage' do
    expect(page).to have_content(building.description)
  end

  describe 'building inventory' do
    it 'adds items to the building inventory' do
      within("#building-#{building.id} #inventory") { click_link 'Add Item' }
      click_link item.full_name

      visit game_path

      within("#building-#{building.id} #inventory") { expect(page).to have_content(item.full_name) }
    end

    it 'limits inventory on private buildings' do
      make_building_private
      within("#building-#{building.id} #inventory") do
        expect(page).to have_no_content 'Add Item'
      end
    end

    it 'allows inventory on my private buildings' do
      building.update(created_by: player)
      make_building_private
      within("#building-#{building.id} #inventory") do
        expect(page).to have_content 'Add Item'
      end
    end

    pending 'version_0.3 check privacy on actual requests, not just listing the link. prevent link spoofing'

    it 'picks up an item' do
      item.update(parent_inventory: building.child_inventory)
      visit game_path
      click_link building.name
      within("#building-#{building.id} #inventory") { find_by_id("pickup-#{item.id}").click }
      expect(player.inventory.items.include?(item)).to be true
    end

    it 'doesnt pick up an item from private' do
      item.update(parent_inventory: building.child_inventory)
      make_building_private
      within("#building-#{building.id} #inventory") { expect(page).to have_no_content('pickup') }
    end
  end

  describe 'sales listings' do
    describe 'lists an item in inventory for sale' do
      before do
        item = player.inventory.items.last

        list_a_sale(item)
      end

      it 'lists the sale' do
        within "#building-#{building.id} #sales-listings" do
          expect(page).to have_content(item.full_name)
        end
      end

      it 'removes item from inventory' do
        within("#building-#{building.id} #inventory") { expect(page).to have_no_content(item.full_name) }
      end
    end

    it 'lists a sale from building inventory' do
      item = building.child_inventory.items.last

      list_a_sale(item)

      within "#building-#{building.id} #sales-listings" do
        expect(page).to have_content(item.full_name)
      end
    end

    it 'cannot double list an item' do
      item = building.child_inventory.items.last

      list_a_sale(item)
      expect { list_a_sale(item) }.to(
        raise_error(Capybara::ElementNotFound, /Unable to find option "#{item.full_name}/)
      )
    end

    it 'limits sales on a private store' do
      make_building_private
      within("#building-#{building.id} #sales-listings") do
        expect(page).to have_no_content 'List Sale'
      end
    end

    it 'allows sales on my private store' do
      building.update(created_by: player)
      make_building_private
      within("#building-#{building.id} #sales-listings") do
        expect(page).to have_content 'List Sale'
      end
    end

    pending 'version_0.3 check privacy on actual requests, not just listing the link'
  end

  pending 'version_0.5 counter a trade in the hall'

  it 'accepts a trade in the hall' do
    listing = create(:listing, building: building, price: 1)

    accept_a_sale(listing)
    visit game_path

    within('.inventory') { expect(page).to have_content(listing.item.full_name) }
  end

  it 'requires proper payment' do
    listing = create(:listing, building: building, price: player.credits + 1)

    accept_a_sale(listing)

    expect(page).to have_content('You can\'t afford that.')
  end

  describe 'notifications' do
    pending 'version_0.7 trade was accepted'
    pending 'version_0.7 trade expired'
    pending 'version_0.7 trade countered'
  end
end

def list_a_sale(item)
  price = rand(1..100)

  within "#building-#{building.id} #sales-listings" do
    click_link 'List Sale'
  end

  fill_in 'listing_price', with: price

  select item.full_name, from: 'listing_item_id'
  click_button 'Create Listing'

  visit game_path
  click_link building.name
end

def accept_a_sale(listing)
  visit game_path
  click_link building.name

  within "#building-#{building.id} #sales-listings" do
    click_link listing.item.full_name
  end
  click_link "Pay #{listing.price}¤"
end

def make_building_private
  building.update(is_private: true)
  visit game_path
  click_link building.name
end
