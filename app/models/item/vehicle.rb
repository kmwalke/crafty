class Item::Vehicle < Item
  include Equippable

  has_one :equipped_by, class_name: 'User'

  def actions
    %w[travel]
  end

  def travel(location)
    return unless equipped_by&.spend_energy(energy_usage(equipped_by.location, location))

    equipped_by.update(location: location)
  end

  private

  def energy_usage(location1, location2)
    (location1.distance_from(location2) * energy_multiplier).to_i
  end
end
