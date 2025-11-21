class Item::Crafted::Pet < Item::Crafted
  include Equippable
  include HasInventory

  before_create :provision_inventory

  def recipe
    {
      ItemType::CRAFTED[:leather] => 2
    }
  end
end
