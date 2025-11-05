class Craftable
  extend ActiveSupport::Concern

  def recipe
    raise CraftyError, ErrorMessage::GENERIC[:interface_method]
  end
end
