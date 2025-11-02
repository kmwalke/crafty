class CraftController < ApplicationController
  before_action :logged_in

  def design; end

  def confirm
    game_action(path: craft_design_path) do
    end
  end
end
