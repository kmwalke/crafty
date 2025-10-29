require 'rails_helper'

RSpec.describe ItemType do
  pending 'change the layout of TYPES. have Item::CRAFTABLE[:building] instead of Item::TYPES[:craftable_building]'
  it 'populates the types' do
    described_class.destroy_all
    described_class.populate_types
    ItemType::TYPE_NAMES.each do |name|
      expect(described_class.find_by(name:)).to be_a(described_class)
    end
  end
end
