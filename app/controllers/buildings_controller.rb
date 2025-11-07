class BuildingsController < ApplicationController
  before_action :logged_in
  before_action :set_building
  before_action :set_item, only: [:add_item, :pickup_item]

  def add_item
    game_action(path: inventory_building_path(@building)) do
      @item.update(inventory: @building.child_inventory)
    end
  end

  def inventory; end

  def pickup_item
    game_action(path: inventory_building_path(@building)) do
      @item.update(inventory: player.inventory)
    end
  end

  def sales_listings; end

  def select_item; end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_building
    @building = Item::Craftable::Building.find(params[:building_id])
  end
end
