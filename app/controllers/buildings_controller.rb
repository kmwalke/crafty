class BuildingsController < ApplicationController
  before_action :logged_in
  before_action :set_building
  before_action :set_item, only: [:add_item, :pickup_item]

  def add_item
    game_action(path: inventory_building_path(@building)) do
      @player.inventory.remove_item(@item)
      @building.child_inventory.add_item(@item)
    end
  end

  def inventory; end

  def pickup_item
    game_action(path: inventory_building_path(@building)) do
      @building.child_inventory.remove_item(@item)
      @player.add_item(@item)
    end
  end

  def sales_listings; end

  def select_item; end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_building
    @building = Item::Crafted::Building.find(params[:building_id])
  end
end
