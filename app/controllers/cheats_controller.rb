class CheatsController < ApplicationController
  before_action :logged_in

  def index
    @current_location = @current_user.location
    @local_players    = User.where(location: @current_location).where.not(id: @current_user.id)
    @local_resources  = Resource.where(location: @current_location)
  end

  def monster_energy
    @current_user.update(energy: User::MAX_ENERGY)

    redirect_to game_path
  end

  def reset_db
    `./script/reset_db.sh`

    redirect_to logout_path, notice: 'Give it a few minutes'
  end
end
