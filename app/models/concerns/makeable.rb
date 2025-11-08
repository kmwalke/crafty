module Makeable
  extend ActiveSupport::Concern

  def recipe
    [
      'Coming Soon'
    ]
  end

  def build_name(ingredients)
    ingredients.map(&:name).uniq.join(' ')
  end
end
