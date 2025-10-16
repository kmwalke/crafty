class Item::Vehicle < Item
  include Equippable

  has_one :equipped_by, class_name: 'User'

  def actions
    %w[travel]
  end

  def travel(location)
    raise CraftyError, 'You have to equip a vehicle to travel in it.' if equipped_by.nil?
    unless equipped_by.spend_energy(energy_usage(equipped_by.location, location))
      raise CraftyError, 'You don\'t have enough energy.'
    end

    equipped_by.update(location: location)
  end

  private

  def energy_usage(location1, location2)
    location1.distance_from(location2) * energy_multiplier
  end
end
