class ChatsController < ApplicationController
  before_action :logged_in
  before_action :set_location

  def index

  end

  def create

  end

  private

  def set_location
    @location = Location.find(params[:location_id])
  end
end