class GameController < ApplicationController
  before_action :logged_in

  def index
    @current_location = @current_user.location
    @local_players    = User.where(location: @current_location).where.not(id: @current_user.id)
    @local_resources  = Resource.where(location: @current_location)
  end

  def equip_item
    item = Item.find(params[:id])

    @current_user.equip_item(item) if item.type == 'Vehicle'

    redirect_to game_path
  end

  def unequip_vehicle
    @current_user.unequip_vehicle

    redirect_to game_path
  end

  def travel
    location = Location.find(params[:id])

    @current_user.travel(location)

    redirect_to game_path
  end
end
