module Equippable
  extend ActiveSupport::Concern

  def actions
    raise CraftyError, ErrorMessage::GENERIC[:interface_method]
  end

  private

  def energy_usage(*_args)
    raise CraftyError, ErrorMessage::GENERIC[:interface_method]
  end

  def energy_multiplier
    case level
    when Level::COMMON
      2
    when Level::UNCOMMON
      1.5
    when Level::RARE
      1
    when Level::EPIC
      0.5
    when Level::LEGENDARY
      0.1
    end
  end
end
