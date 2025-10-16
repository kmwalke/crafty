class Inventory < ApplicationRecord
  belongs_to :user
  has_many :items

  delegate :count, to: :items

  def remaining_space
    size - count
  end

  def add_item(item)
    return false unless remaining_space.positive? && item.new_record?

    item.inventory = self
    item.save
  end
end
