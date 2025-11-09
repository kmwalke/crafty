class Item::Crafted::Vehicle < Item::Crafted
  include Equippable
  include SimpleName

  has_one :equipped_by, class_name: 'User'

  def actions
    []
  end
end
