class Item::Craftable::Tool < Item
  include Equippable
  include Craftable

  has_one :equipped_by, class_name: 'User'

  def actions
    %w[gather]
  end

  def gather(_resource)
    raise CraftyError, ErrorMessage::GENERIC[:interface_method]
  end
end
