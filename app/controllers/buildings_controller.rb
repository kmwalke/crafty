class BuildingsController < ApplicationController
  before_action :logged_in
  before_action :set_building
  before_action :set_item, only: :add_item

  def select_item; end

  def add_item
    game_action do
      @item.update(inventory: @building.child_inventory)
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_building
    @building = Item::Craftable::Building.find(params[:id])
  end
end
