class CheatsController < ApplicationController
  before_action :logged_in

  def monster_energy
    @current_user.update(energy: User::MAX_ENERGY)

    redirect_to game_path
  end
end
