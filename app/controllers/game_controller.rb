class GameController < ApplicationController
  before_action :logged_in

  def index
    @local_players = User.where(location: @current_user.location).where.not(id: @current_user.id)
  end

  def equip_item
    item = Item.find(params[:id])

    @current_user.equip_vehicle(item) if item.type == Vehicle.name

    redirect_to game_path
  end
end
