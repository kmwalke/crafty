module ApplicationHelper
  def credit_symbol
    '¤'
  end

  def percentage(numerator, denominator)
    "#{((numerator.to_f / denominator) * 100).round}%"
  end

  def pretty_type(type)
    type.split('::').last
  end

  def sky_color(_location)
    '#668cff'
  end

  def stack_amount(item)
    item.stack_amount if item.stack_amount > 1
  end
end
