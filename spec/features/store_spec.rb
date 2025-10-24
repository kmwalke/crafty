require 'rails_helper'

RSpec.describe 'Store' do
  # Trading hall allows auction house like listings
  # Trading is async.
  # UX: You enter the trading hall. you peruse the listings and once catches your eye.
  #     A Rare vehicle!  It is a little expensive though.  They want 20x gold coins.
  #     You counter the offer at 15 gold pieces.
  #     The gold pieces are removed from your inventory.  The hall will keep them safe.
  #     Some time later, the player who listed the trade accepts.
  #     You are notified and the new item is ready for pickup at the hall.

  # UX: Same as above, but the price is right.  You accept the trade immediately.
  #     20x Gold Coins removed from your inventory.  Listing player is notified.
  #     Your new vehicle is ready for pickup at the hall right away

  # UX: Same as first, but after some time, the listing player declines the counter
  #     You are notified.  Your gold coins are ready for pickup at the hall

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

  it 'adds items to the building inventory' do
    # each building has an inventory.  items can be in inventory without being for sale
    # this could allow some automated linkage between your supplier and your shop.
    # ie your mine delivers directly to your shop
    within "#building-#{building.id}" do
      click_link 'Add Item'
    end
    click_link item.full_name

    within "#building-#{building.id}" do
      expect(page).to have_content(item.full_name)
    end
  end

  it 'picks up an item' do
  end

  it 'lists an item in inventory for sale' do
    # mark an item from inventory as "for sale"
    # set a price for that item
    # a "price" is another item.  ie: I list 1 legendary mushroom fruit for sale for 20 common crystal shards
  end

  it 'requires access to list' do
    # only the owner of the store can list sales
  end

  it 'is a public trading hall' do
    # anyone can list sales
  end

  pending 'counter a trade in the hall'
  pending 'accept a trade in the hall'

  describe 'notifications' do
    pending 'trade was accepted'
    pending 'trade expired'
    pending 'trade countered'
  end
end
