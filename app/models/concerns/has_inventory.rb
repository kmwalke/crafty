module HasInventory
  extend ActiveSupport::Concern

  def base_inventory
    10
  end

  private

  def provision_inventory
    create_child_inventory(size: inventory_size)
  end

  def inventory_size
    level * base_inventory
  end
end
