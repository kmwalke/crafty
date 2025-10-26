class BuildingsController < ApplicationController
  before_action :logged_in
  before_action :set_building
  before_action :set_item, only: :add_item

  def add_item
    game_action(path: building_inventory_path(@building)) do
      @item.update(inventory: @building.child_inventory)
    end
  end

  def inventory; end

  def sales_listings; end

  def select_item; end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_building
    @building = Item::Craftable::Building.find(params[:id])
  end
end
