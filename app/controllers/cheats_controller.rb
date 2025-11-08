class CheatsController < ApplicationController
  before_action :logged_in

  def monster_energy
    game_action do
      player.update(energy: User::MAX_ENERGY)
    end
  end
end
