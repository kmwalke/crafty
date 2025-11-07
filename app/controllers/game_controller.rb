class GameController < ApplicationController
  before_action :logged_in

  def index
    game_action redirect: false do
      @current_location = current_user.location
      @local_players    = User.where(location: @current_location).where.not(id: current_user.id)
      @local_resources  = Resource.where(location: @current_location)
      @local_buildings  = @current_location.property
    end
  end

  def gather
    game_action do
      item    = current_user.gather(Resource.find(params[:id]))
      @notice = level_color_span(item.level, item.full_name)
    end
  end

  def travel
    game_action do
      location = Location.find(params[:id])

      current_user.travel(location)
    end
  end
end
