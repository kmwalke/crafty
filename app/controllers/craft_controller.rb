class CraftController < ApplicationController
  before_action :logged_in

  def design
    @craftable_items = ItemType::CRAFTABLE.values
  end

  def confirm
    game_action(path: craft_design_path) do
      puts craft_params
    end
  end

  def craft_params
    params.expect(recipe: [:item_type, { ingredients: [] }])
  end
end
