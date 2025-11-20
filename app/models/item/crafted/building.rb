class Item::Crafted::Building < Item::Crafted
  include Useable

  before_create :provision_inventory

  has_many :listings

  DEFAULT_INVENTORY_SIZE = 50

  def recipe
    {
      ItemType::CRAFTED[:plank] => 10,
      ItemType::CRAFTED[:beam] => 3,
      ItemType::CRAFTED[:screw] => 400
    }
  end

  def use
    location = parent_inventory.user.location
    parent_inventory.remove_item(self)
    location.property.add_item(self)
  end

  private

  def provision_inventory
    create_child_inventory(size: DEFAULT_INVENTORY_SIZE)
  end
end
