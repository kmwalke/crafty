module HasInventory
  extend ActiveSupport::Concern

  private

  def provision_inventory
    create_child_inventory(size: inventory_size)
  end

  def inventory_size
    level * 10
  end
end
