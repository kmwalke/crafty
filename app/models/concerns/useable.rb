module Useable
  extend ActiveSupport::Concern

  def useable?
    true
  end

  def use
    raise CraftyError, ErrorMessage::GENERIC[:interface_method]
  end
end
