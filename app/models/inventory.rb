class Inventory < ApplicationRecord
  belongs_to :user
  has_many :items

  def add_item(name: nil, description: nil, created_by: nil, level: nil, type: nil)
    return false unless items.count < size

    Item.create(
      inventory: self,
      created_by: created_by,
      description:,
      name:,
      level:,
      type:
    )
  end
end
