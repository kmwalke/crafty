class Item::Crafted < Item
  def recipe
    []
  end

  def build_name(ingredients)
    ingredients.map(&:name).uniq.join(' ')
  end

  def crafting_yield
    1
  end
end
