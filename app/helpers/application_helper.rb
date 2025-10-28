module ApplicationHelper
  def credit_symbol
    '¤'
  end

  def percentage(numerator, denominator)
    "#{((numerator.to_f / denominator) * 100).round}%"
  end

  def sky_color(_location)
    '#668cff'
  end
end
