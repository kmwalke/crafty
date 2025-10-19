class Inventory < ApplicationRecord
  before_save :user_xor_location

  belongs_to :user, optional: true
  belongs_to :location, optional: true
  has_many :items

  delegate :any?, :count, :include?, to: :items

  def remaining_space
    size - count
  end

  def add_item(item)
    raise CraftyError, ErrorMessage::INVENTORY[:already_in_inventory] if item.inventory
    raise CraftyError, ErrorMessage::INVENTORY[:typed_inventory] unless type.nil? || type == item.type

<<<<<<< Updated upstream
    item.inventory = self
    item.save
    item
=======
    item_in_inv = items.find_by(type: item.type, level: item.level, name: item.name)

    if item_in_inv
      item_in_inv.update(stack_amount: (item_in_inv.stack_amount + 1))
      item_in_inv
    else
      raise CraftyError, ErrorMessage::INVENTORY[:no_space] unless remaining_space.positive?
      
      item.inventory = self
      item.save
      item
    end
>>>>>>> Stashed changes
  end

  private

  def user_xor_location
    return if user.nil? ^ location.nil?

    raise CraftyError, 'an Inventory must belong to a user or a location.'
  end
end
