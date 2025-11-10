class Item::Crafted::Building < Item::Crafted
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

  private

  def provision_inventory
    create_child_inventory(size: DEFAULT_INVENTORY_SIZE)
  end
end
