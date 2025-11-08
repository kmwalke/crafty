class Item::Crafted < Item
  def recipe
    []
  end

  def build_name(ingredients)
    ingredients.map(&:name).uniq.join(' ')
  end
end
