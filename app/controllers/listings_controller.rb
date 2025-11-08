class ListingsController < ApplicationController
  before_action :logged_in
  before_action :set_listing, except: [:index, :new, :create]
  before_action :set_building

  def index
    game_action redirect: false do
      @listings = Listing.all
    end
  end

  def new
    game_action redirect: false do
      @listing     = Listing.new
      @valid_items = player.inventory.items + @building.child_inventory.items - building_listing_items
    end
  end

  def edit; end

  def create
    game_action path: listings_path(@building) do
      @listing = Listing.new(listing_params)

      @listing.item.update(parent_inventory: nil) if @listing.save
    end
  end

  def update
    game_action path: listings_path(@building) do
      if @listing.update(listing_params)
        item                     = @listing.item
        item.parent_inventory_id = @building.child_inventory_id
        item.save
      end
    end
  end

  def destroy
    game_action path: listings_path(@building) do
      @listing.destroy!
    end
  end

  def purchase; end

  def confirm_purchase
    game_action path: listings_path(@building) do
      @listing.purchase(player)
    end
  end

  private

  def set_listing
    @listing = Listing.find(params.expect(:id))
  end

  def set_building
    @building = Item::Craftable::Building.find(params.expect(:building_id))
  end

  def building_listing_items
    @building.listings.map(&:item)
  end

  def listing_params
    params.expect(listing: [:building_id, :item_id, :created_by_id, :price])
  end
end
