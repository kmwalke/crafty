class CheatsController < ApplicationController
  before_action :logged_in

  def monster_energy
    @current_user.update(energy: User::MAX_ENERGY)

    redirect_to game_path
  end

  def reset_db
    pid = spawn './script/reset_db.sh &'

    redirect_to logout_path, notice: "Give it a few minutes. PID #{pid}"
  end
end
