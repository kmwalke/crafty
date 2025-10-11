class Vehicle < Item
  has_one :user

  def actions
    %w[travel]
  end

  def travel(location)
    return if user.nil?

    user.spend_energy(energy_usage(user.location, location))
    user.update(location: location)
  end

  private
  def energy_usage(location1, location2)
    location1.distance_from(location2) * energy_multiplier
  end

  def energy_multiplier
    (((level - 3.0) * -1) / 2) + 1
  end
end
