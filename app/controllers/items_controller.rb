class ItemsController < ApplicationController
  before_action :logged_in
  before_action :set_item, except: [:unequip_tool, :unequip_vehicle]

  def drop_item
    game_action(path: game_path(active_control: 'inventory')) do
      player.remove_item(@item)
    end
  end

  def equip_item
    game_action(path: game_path(active_control: 'equipment')) do
      player.equip_item(@item) if @item.equippable?

      @notice = "#{level_color_span(@item.level, @item.name)} equipped"
    end
  end

  def use_item
    game_action(path: game_path(active_control: 'inventory')) do
      player.use_item(@item) if @item.useable?
    end
  end

  def unequip_tool
    game_action(path: game_path(active_control: 'equipment')) do
      player.unequip_tool
    end
  end

  def unequip_vehicle
    game_action(path: game_path(active_control: 'equipment')) do
      player.unequip_vehicle
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
