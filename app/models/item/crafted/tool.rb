class Item::Crafted::Tool < Item::Crafted
  include Equippable

  has_one :equipped_by, class_name: 'User', as: :tool

  def actions
    []
  end
end
