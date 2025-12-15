class ChatsController < ApplicationController
  before_action :logged_in
  before_action :set_location

  def index

  end

  def create
    game_action do
      Chat.create(
        content: params[:content],
        location_id: params[:location_id],
        user: @player
      )
    end
  end

  private

  def set_location
    @location = Location.find(params[:location_id])
  end
end