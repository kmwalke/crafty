class ItemsController < ApplicationController
  before_action :logged_in

  def equip_item
    game_action do
      item = Item.find(params[:id])

      player.equip_item(item) if item.equippable?

      @notice = "#{level_color_span(item.level, item.name)} equipped"
    end
  end

  def use_item
    game_action do
      item = Item.find(params[:id])

      player.use_item(item) if item.useable?
    end
  end

  def unequip_tool
    game_action do
      player.unequip_tool
    end
  end

  def unequip_vehicle
    game_action do
      player.unequip_vehicle
    end
  end
end
