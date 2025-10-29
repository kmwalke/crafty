class ItemsController < ApplicationController
  before_action :logged_in

  def equip_item
    game_action do
      item = Item.find(params[:id])

      @current_user.equip_item(item) if item.equipable?

      @notice = "#{level_color_span(item.level, item.name)} equipped"
    end
  end

  def unequip_tool
    game_action do
      @current_user.unequip_tool
    end
  end

  def unequip_vehicle
    game_action do
      @current_user.unequip_vehicle
    end
  end
end
