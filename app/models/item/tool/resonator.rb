module Item
  module Tool
    class Resonator < Item::Tool
      include Equippable

      self.inheritance_column = 'subtype'
    end
  end
end
