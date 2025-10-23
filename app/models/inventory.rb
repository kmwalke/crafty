class Inventory < ApplicationRecord
  before_save :user_xor_location

  belongs_to :user, optional: true
  belongs_to :location, optional: true
  belongs_to :building, optional: true
  has_many :items

  delegate :any?, :count, :each, :include?, to: :items

  def owner
    raise CraftyError, 'user || location || item || sale. some generic function to get the owner if unknown. maybe return a classname?' \
      'should probably reverse all the ids in inventory?'
  end

  def remaining_space
    size - count
  end

  def add_item(item)
    raise CraftyError, ErrorMessage::INVENTORY[:already_in_inventory] if item.inventory
    raise CraftyError, ErrorMessage::INVENTORY[:typed_inventory] unless allowed_type.nil? || allowed_type == item.type

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
  end

  private

  def user_xor_location
    return if user.nil? ^ location.nil?

    raise CraftyError, 'an Inventory must belong to a user or a location.'
  end
end
