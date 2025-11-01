class Listing < ApplicationRecord
  belongs_to :building, class_name: 'Item::Craftable::Building'
  belongs_to :created_by, class_name: 'User'
  belongs_to :item

  def purchase(buyer)
    raise CraftyError, 'You can\'t afford that.' unless can_afford?(buyer)

    buyer.update(credits: (buyer.credits - price))
    created_by.update(credits: (created_by.credits + price))
    item.update(inventory: buyer.inventory)
    destroy
  end

  private

  def can_afford?(buyer)
    price <= buyer.credits
  end
end
