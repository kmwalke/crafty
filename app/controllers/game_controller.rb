class GameController < ApplicationController
  before_action :logged_in

  def index
    @local_players = User.where(location: @current_user.location)
  end
end
