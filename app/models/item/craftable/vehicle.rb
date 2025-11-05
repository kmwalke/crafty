class Item::Craftable::Vehicle < Item
  include Craftable
  include Equippable
  include SimpleName

  has_one :equipped_by, class_name: 'User'

  def actions
    %w[travel]
  end

  def travel(location)
    ActiveRecord::Base.transaction do
      raise CraftyError, ErrorMessage::ITEM[:must_equip_item] if equipped_by.nil?
      unless equipped_by.spend_energy(energy_usage(equipped_by.location, location))
        raise CraftyError, ErrorMessage::USER[:build_additional_pylons]
      end

      equipped_by.update(location: location)
    end
  end

  private

  def energy_usage(location1, location2)
    location1.distance_from(location2) * energy_multiplier
  end
end
