module Useable
  extend ActiveSupport::Concern

  def useable?
    true
  end

  def use
    raise CraftyError, ErrorMessage::GENERIC[:interface_method]
  end

  private

  def consume_self
    if stack_amount > 1
      update(stack_amount: (stack_amount - 1))
    else
      destroy
    end
  end
end
