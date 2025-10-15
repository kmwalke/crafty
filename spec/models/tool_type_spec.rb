require 'rails_helper'

RSpec.describe ItemToolSubtype do
  it 'populates types' do
    described_class.delete_all

    described_class.populates_types

    ItemToolSubtype::TYPE_NAMES.each do |type|
      expect(described_class.find_by(name: type)).to be_a(described_class)
    end
  end
end
