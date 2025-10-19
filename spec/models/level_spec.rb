require 'rails_helper'

RSpec.describe Level do
  describe 'level name' do
    it 'validates the level number' do
      expect { described_class.level_name(Level::NUMBERS.last + 1) }.to raise_error(CraftyError)
    end

    it 'gets the name' do
      number = Level::NUMBERS.sample
      expect(described_class.level_name(number)).to eq(Level::NAMES[number - 1])
    end

    it 'populates the levels' do
      described_class.destroy_all
      described_class.populate_levels
      Level::NAMES.each do |name|
        expect(described_class.find_by(name:)).to be_a(described_class)
      end
    end
  end
end
