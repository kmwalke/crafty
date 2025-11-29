require 'rails_helper'

RSpec.describe Dungeon do
  let(:dungeon) { create(:dungeon) }

  it 'has rooms' do
    create(:room, dungeon:, level: Level::LEGENDARY)
    expect(dungeon.rooms.first).to be_a Room
  end

  it 'has a location' do
    expect(dungeon.location).to be_a Location
  end

  it 'sets the level' do
    Level::NUMBERS.each do |level|
      dungeon.rooms << create(:room, level:)
    end
    create(:room, dungeon:, level: Level::LEGENDARY)

    expect(dungeon.level).to eq(Level::RARE)
  end
end
