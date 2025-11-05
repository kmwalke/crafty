module Useable
  extend ActiveSupport::Concern

  def use
    raise CraftyError, ErrorMessage::GENERIC[:interface_method]
  end
end
