module ApplicationHelper
  def percentage(numerator, denominator)
    "#{((numerator.to_f / denominator.to_f)*100).round}%"
  end
end
