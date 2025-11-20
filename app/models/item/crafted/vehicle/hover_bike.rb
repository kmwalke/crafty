class Item::Crafted::Vehicle::HoverBike < Item::Crafted::Vehicle
  include HasInventory

  before_create :provision_inventory

  def recipe
    {
      ItemType::CRAFTED[:frame] => 1,
      ItemType::CRAFTED[:component] => 30,
      ItemType::CRAFTED[:plastic] => 10
    }
  end

  def build_name(ingredients)
    ingredients.select { |i| i.type == ItemType::CRAFTED[:frame] }.first.name
  end
end
