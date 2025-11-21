class Item::Crafted::Pet < Item::Crafted
  include Equippable
  include HasInventory

  before_create :provision_inventory

  def recipe
    {
      ItemType::GATHERABLE[:companion] => 1,
      ItemType::GATHERABLE[:fish] => 10
    }
  end

  def build_name(ingredients)
    ingredients.select { |i| i.type == ItemType::GATHERABLE[:companion] }.first.name
  end
end
