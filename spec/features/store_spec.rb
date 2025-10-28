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

  it 'requires all purchases to be made with coins!!!!' do
    # you know, I am just going to force using coins.  It will massively simplify things.
    # earn coins by selling things
    # Folks can trade directly with each other later
    # Auction house listings require using coins
  end

  it 'building section of homepage' do
    expect(page).to have_content(building.description)
  end

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

  it 'lists an item in inventory for sale' do
    item         = player.inventory.items.last
    price_type   = ItemType::TYPE_NAMES.sample
    price_level  = Level::NAMES.sample
    price_amount = rand(1..100)

    within "#building-#{building.id} #sales-listings" do
      click_link 'List Sale'
    end

    select item.full_name_level, from: 'listing_item_id'
    select price_type, from: 'listing_price_type'
    select price_level, from: 'listing_price_level'
    fill_in 'listing_price_amount', with: price_amount

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
    item        = player.inventory.items.last
    listing     = create(
      :listing,
      building: building,
      price_amount: item.stack_amount,
      price_type: item.type,
      price_level: item.level
    )
    listed_item = listing.item

    visit game_path
    click_link building.name

    within "#building-#{building.id} #sales-listings" do
      click_link listing.item.full_name
    end
    visit purchase_listing_path(building, listing)
    click_link item.full_name

    expect(player.reload.inventory.reload.include?(listed_item)).to be true
  end

  it 'requires proper payment' do
    item    = player.inventory.items.last
    listing = create(
      :listing,
      building: building,
      price_amount: item.stack_amount + 1,
      price_type: item.type,
      price_level: item.level
    )

    visit game_path
    click_link building.name

    within "#building-#{building.id} #sales-listings" do
      click_link listing.item.full_name
    end
    click_link item.full_name

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

  describe 'notifications' do
    pending 'trade was accepted'
    pending 'trade expired'
    pending 'trade countered'
  end
end
