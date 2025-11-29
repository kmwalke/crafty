require 'rails_helper'

RSpec.describe ItemType do
  it 'populates the types' do
    described_class.destroy_all
    described_class.populate
    ItemType::TYPE_NAMES.each do |name|
      expect(described_class.find_by(name:)).to be_a(described_class)
    end
  end
end
