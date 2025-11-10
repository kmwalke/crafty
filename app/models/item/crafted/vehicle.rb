class Item::Crafted::Vehicle < Item::Crafted
  include Equippable

  has_one :equipped_by, class_name: 'User'

  def actions
    %w[travel]
  end

  def travel(location)
    raise CraftyError, ErrorMessage::ITEM[:must_equip_item] if equipped_by.nil?
    unless equipped_by.spend_energy(energy_usage(equipped_by.location, location))
      raise CraftyError, ErrorMessage::USER[:build_additional_pylons]
    end

    equipped_by.update(location: location)
  end

  def energy_usage(location1, location2)
    (location1.distance_from(location2) * energy_multiplier).to_i
  end

  def valid_travel_locations
    Location.where.not(id: equipped_by.location_id).order(:id)
  end
end
