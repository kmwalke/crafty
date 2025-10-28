class ListingsController < ApplicationController
  before_action :logged_in
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_building

  # GET /listings or /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show; end

  # GET /listings/new
  def new
    @listing     = Listing.new
    @valid_items = @current_user.inventory.items
  end

  # GET /listings/1/edit
  def edit; end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        @listing.item.update(inventory: @building.child_inventory)
        format.html { redirect_to building_sales_listings_path(@building), notice: 'Listing was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        item              = @listing.item
        item.inventory_id = @building.child_inventory_id
        item.save
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.', status: :see_other }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy!

    respond_to do |format|
      format.html { redirect_to listings_path, notice: 'Listing was successfully destroyed.', status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params.expect(:id))
  end

  def set_building
    @building = Item::Craftable::Building.find(params.expect(:building_id))
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.expect(listing: [:building_id, :item_id, :created_by_id, :price_type, :price_amount, :price_level])
  end
end
