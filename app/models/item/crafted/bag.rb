class Item::Crafted::Bag < Item::Crafted
  include HasInventory

  before_create :provision_inventory

  def recipe
    {
      ItemType::CRAFTED[:leather] => 2
    }
  end
end
