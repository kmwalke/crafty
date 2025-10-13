class HomeController < ApplicationController
  def index
    redirect_to game_path unless current_user.nil?
  end
end
