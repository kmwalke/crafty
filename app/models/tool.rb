class Tool < Item
  include Equippable

  has_one :user

  def actions
    %w[travel]
  end

  def travel(location)
    return unless user&.spend_energy(energy_usage(user.location, location))

    user.update(location: location)
  end
end
