class GameController < ApplicationController
  before_action :logged_in

  def index
    game_action redirect: false do
      @current_location = @current_user.location
      @local_players    = User.where(location: @current_location).where.not(id: @current_user.id)
      @local_resources  = Resource.where(location: @current_location)
      raise CraftyError, 'thing'
    end
  end

  def equip_item
    game_action do
      item = Item.find(params[:id])

      @current_user.equip_item(item) if item.equipable?

      @notice = "#{level_color(item.level, item.name)} equipped"
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

  def gather
    game_action do
      item    = @current_user.gather(Resource.find(params[:id]))
      @notice = level_color(item.level, item.name)
    end
  end

  def travel
    game_action do
      location = Location.find(params[:id])

      @current_user.travel(location)
    end
  end

  private

  def game_action(redirect: true)
    yield
  rescue CraftyError => e
    @notice = e.to_s
  rescue StandardError
    @notice = 'An unknown error has occurred.'
  ensure
    redirect_to game_path, notice: @notice if redirect
  end
end
