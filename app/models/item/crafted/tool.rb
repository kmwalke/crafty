class Item::Crafted::Tool < Item::Crafted
  include Equippable
  include SimpleName

  def actions
    []
  end
end
