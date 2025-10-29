require 'rails_helper'

RSpec.describe 'Store' do
  pending 'listing a sale/purchasing an item does not update inventory until refresh'
  # Trading hall allows auction house like listings
  # Trading is async.
  # UX: You enter the trading hall. you peruse the listings and once catches your eye.
  #     A Rare vehicle!  It is a little expensive though.  They want 20x credits
  #     You counter the offer at 15 credits.
  #     The gold pieces are removed from your inventory.  The hall will keep them safe.
  #     Some time later, the player who listed the trade accepts.
  #     You are notified and the new item is ready for pickup at the hall.

  # UX: Same as above, but the price is right.  You accept the trade immediately.
  #     20x credits removed from your inventory.  Listing player is notified.
  #     Your new vehicle is ready for pickup at the hall right away

  # UX: Same as first, but after some time, the listing player declines the counter
  #     You are notified.  Your credits are ready for pickup at the hall

  # all these "notices" imply in game mail.  The flash notice is too ephemeral
  # probably in game email or something.  whew, fun

  let!(:player) { create(:user) }
  let!(:building) { build(:craftable_building, inventory: nil) }
  let!(:item) { player.inventory.add_item(build(:gatherable_fruit, inventory: nil)) }

  before do
    player.location.add_building(building)

    login_as player
    visit game_path
    click_link building.name
  end

  it 'building section of homepage' do
    expect(page).to have_content(building.description)
  end

  describe 'building inventory' do
    it 'adds items to the building inventory', skip: 'disabled for now' do
      within "#building-#{building.id} #inventory" do
        click_link 'Add Item'
      end
      click_link item.full_name

      visit game_path
      click_link building.name

      within "#building-#{building.id} #inventory" do
        expect(page).to have_content(item.full_name)
      end
    end

    it 'picks up an item' do
    end
  end

  describe 'sales listings' do
    it 'lists an item in inventory for sale' do
      item = player.inventory.items.last
      price = rand(1..100)

      within "#building-#{building.id} #sales-listings" do
        click_link 'List Sale'
      end

      fill_in 'listing_price', with: price

      click_button 'Create Listing'

      visit game_path
      click_link building.name

      within "#building-#{building.id} #sales-listings" do
        expect(page).to have_content(item.full_name)
      end
    end

    it 'requires access to list' do
      # only the owner of the store can list sales
    end

    it 'is a public trading hall' do
      # anyone can list sales
    end

    pending 'counter a trade in the hall'

    it 'accepts a trade in the hall' do
      listing = create(:listing, building: building, price: 1)
      listed_item = listing.item

      visit game_path
      click_link building.name

      within "#building-#{building.id} #sales-listings" do
        click_link listing.item.full_name
      end
      visit purchase_listing_path(building, listing)
      click_link "Pay #{listing.price}¤"

      visit game_path

      within '.inventory' do
        expect(page).to have_content(listed_item.full_name)
      end
    end

    it 'requires proper payment' do
      listing = create(:listing, building: building, price: player.credits + 1)

      visit game_path
      click_link building.name

      within "#building-#{building.id} #sales-listings" do
        click_link listing.item.full_name
      end
      click_link "Pay #{listing.price}¤"

      expect(page).to have_content('You can\'t afford that.')
    end

    it 'picks up payment for successful listing' do
      # everything from above happens
      # then the lister returns to pick up their payment
    end

    it 'access control for listings' do
      # there is like no control right now
      # much of this should be at the model level
    end
  end

  describe 'notifications' do
    pending 'trade was accepted'
    pending 'trade expired'
    pending 'trade countered'
  end
end
