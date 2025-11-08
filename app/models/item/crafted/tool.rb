class Item::Crafted::Tool < Item
  include Makeable
  include Equippable
  include SimpleName

  has_one :equipped_by, class_name: 'User'

  def actions
    []
  end
end
