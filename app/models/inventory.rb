class Inventory < ApplicationRecord
  belongs_to :user
  has_many :items

  delegate :count, to: :items

  def remaining_space
    size - count
  end

  def add_item(item)
    raise CraftyError, 'No space remaining.' unless remaining_space.positive?
    raise CraftyError, 'Already in an inventory.' if item.inventory

    item.inventory = self
    item.save
  end
end
