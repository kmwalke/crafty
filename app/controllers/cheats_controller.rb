class CheatsController < ApplicationController
  before_action :logged_in

  def monster_energy
    player.update(energy: User::MAX_ENERGY)

    redirect_to game_path
  end
end
