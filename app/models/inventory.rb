class Inventory < ApplicationRecord
  has_one :user
  has_one :location
  has_many :items, inverse_of: :parent_inventory

  delegate :any?, :count, :each, :include?, to: :items

  def owner
    raise CraftyError, 'user || location || item || sale.' \
      'some generic function to get the owner if unknown. maybe return a classname?' \
      'should probably reverse all the ids in inventory?'
  end

  def remaining_space
    size - count
  end

  def add_item(item)
    raise CraftyError, ErrorMessage::INVENTORY[:already_in_inventory] if item.parent_inventory
    raise CraftyError, ErrorMessage::INVENTORY[:typed_inventory] unless type.nil? || type == item.type

    item_in_inv = items.find_by(type: item.type, level: item.level, name: item.name)

    if item_in_inv
      add_to_stack(item_in_inv, item)
    else
      raise CraftyError, ErrorMessage::INVENTORY[:no_space] unless remaining_space.positive?

      place_in_inventory(item)
    end
  end

  private

  def add_to_stack(item_in_inv, new_item)
    item_in_inv.update(stack_amount: (item_in_inv.stack_amount + new_item.stack_amount))
    item_in_inv
  end

  def place_in_inventory(item)
    item.parent_inventory = self
    if item.save
      item
    else
      false
    end
  end
end
