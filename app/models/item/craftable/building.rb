class Item::Craftable::Building < Item
  include Craftable

  before_create :provision_inventory

  DEFAULT_INVENTORY_SIZE = 50

  private

  def provision_inventory
    create_child_inventory(size: DEFAULT_INVENTORY_SIZE)
  end
end
