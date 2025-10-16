require 'rails_helper'

RSpec.describe ResourceType do
  it 'populates types' do
    described_class.delete_all

    described_class.populate_types

    ResourceType::TYPES.each do |type|
      expect(described_class.find_by(name: type)).to be_a(described_class)
    end
  end
end
