class CraftController < ApplicationController
  before_action :logged_in

  def design
    @craftable_items = ItemType::CRAFTABLE.values
  end

  def confirm
    game_action do
      @notice = 'Item Created' if @current_user.craft(craft_params)
    end
  end

  def craft_params
    params.expect(recipe: [:item_type, { ingredients: [] }])
  end
end
