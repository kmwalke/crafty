class DungeonsController < ApplicationController
  before_action :logged_in
  before_action :set_dungeon

  def run
    # game_action(redirect: false) do
    # end
  end

  def show; end

  private

  def set_dungeon
    @dungeon = Dungeon.find(params[:id])
  end
end
