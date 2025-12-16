class ChatsController < ApplicationController
  before_action :logged_in
  before_action :set_location

  def index; end

  def create
    game_action(path: game_path(chat_focus: true)) do
      Chat.create(
        chat_params.merge({ user: @player })
      )
    end
  end

  private

  def set_location
    @location = Location.find(params[:location_id])
  end

  def chat_params
    params.expect(chat: [:location_id, :content])
  end
end
