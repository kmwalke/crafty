class Inventory < ApplicationRecord
  before_save :user_xor_location

  belongs_to :user, optional: true
  belongs_to :location, optional: true
  has_many :items

  delegate :count, to: :items
  delegate :include?, to: :items

  def remaining_space
    size - count
  end

  def add_item(item)
    raise CraftyError, ErrorMessage::INVENTORY[:already_in_inventory] if item.inventory
    raise CraftyError, ErrorMessage::INVENTORY[:no_space] unless remaining_space.positive?
    raise CraftyError, ErrorMessage::INVENTORY[:typed_inventory] unless type.nil? || type == item.type

    item.inventory = self
    item.save
    item
  end

  private

  def user_xor_location
    return if user.nil? ^ location.nil?

    raise CraftyError, 'an Inventory must belong to a user or a location.'
  end
end
