class Item::Tool < Item
  include Equippable

  has_one :equipped_by, class_name: 'User'

  def actions
    %w[gather]
  end

  def gather
    raise 'Not Implemented.'
  end
end
