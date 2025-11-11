class CraftController < ApplicationController
  before_action :logged_in
  before_action :set_crafted_items

  def design; end

  def confirm
    game_action do
      raise CraftyError, ErrorMessage::CRAFTING[:failed] unless @craftable_items.include? craft_params[:item_type]

      crafted_item = craft_params[:item_type].constantize
      ingredients  = craft_params[:item_ids].map do |id|
        Item.find_by(id:)
      end

      if (crafted_item = player.tool.craft(crafted_item, ingredients))
        @notice = "Created #{level_color_span crafted_item.level, crafted_item.full_name}"
      end
    end
  end

  def craft_params
    params.expect(recipe: [:item_type, { item_ids: [] }])
  end

  private

  def set_crafted_items
    @craftable_items = ItemType::CRAFTED.values
  end
end
