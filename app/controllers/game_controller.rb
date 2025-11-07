class GameController < ApplicationController
  before_action :logged_in

  def index
    game_action redirect: false do
      @current_location = player.location
      @local_players    = User.where(location: @current_location).where.not(id: player.id)
      @local_resources  = Resource.where(location: @current_location)
      @local_buildings  = @current_location.property
    end
  end

  def gather
    game_action do
      item    = player.gather(Resource.find(params[:id]))
      @notice = level_color_span(item.level, item.full_name)
    end
  end

  def travel
    game_action do
      location = Location.find(params[:id])

      player.travel(location)
    end
  end
end
