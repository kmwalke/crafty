class Inventory < ApplicationRecord
  belongs_to :user
  has_many :items

  delegate :count, to: :items

  def remaining_space
    size - count
  end

  def add_item(item)
    raise CraftyError, ErrorMessage::INVENTORY[:no_space] unless remaining_space.positive?
    raise CraftyError, ErrorMessage::INVENTORY[:already_in_inventory] if item.inventory

    item.inventory = self
    item.save
  end
end
