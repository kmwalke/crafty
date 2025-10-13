class Tool < Item
  include Equippable

  has_one :user

  def actions
    %w[gather]
  end
end
