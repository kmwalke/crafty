class CraftController < ApplicationController
  before_action :logged_in
  before_action :set_craftable_items

  def design; end

  def confirm
    game_action do
      raise CraftyError, ErrorMessage::CRAFTING[:failed] unless @craftable_items.include? craft_params[:item_type]

      if (crafted_item = current_user.craft(craft_params))
        @notice = "Created #{level_color_span crafted_item.level, crafted_item.full_name}"
      end
    end
  end

  def craft_params
    params.expect(recipe: [:item_type, { item_ids: [] }])
  end

  private

  def set_craftable_items
    @craftable_items = ItemType::CRAFTABLE.values
  end
end
