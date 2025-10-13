module Equippable
  extend ActiveSupport::Concern

  def actions
    raise 'Not implemented.'
  end

  private

  def energy_usage(*_args)
    raise 'Not implemented.'
  end

  def energy_multiplier
    (((level - 3.0) * -1) / 2) + 1
  end
end
