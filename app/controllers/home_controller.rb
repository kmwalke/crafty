class HomeController < ApplicationController
  def index
    redirect_to game_path unless player.nil?
  end
end
