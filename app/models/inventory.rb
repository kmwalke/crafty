class Inventory < ApplicationRecord
  belongs_to :user
  has_many :items

  def add_item(item)
    return false unless items.count < size && item.new_record?

    item.inventory = self
    item.save
  end
end
