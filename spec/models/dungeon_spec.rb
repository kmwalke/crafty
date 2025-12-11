require 'rails_helper'

RSpec.describe Dungeon do
  let(:dungeon) { create(:dungeon) }

  before do
    Level::NUMBERS.each do |level|
      dungeon.rooms << create(:room, level:)
    end
    create(:room, dungeon:, level: Level::LEGENDARY)
  end

  it 'has rooms' do
    expect(dungeon.rooms.first).to be_a Room
  end

  it 'has a location' do
    expect(dungeon.location).to be_a Location
  end

  it 'sets the level' do
    expect(dungeon.level).to eq(Level::RARE)
  end

  it 'runs a dungeon' do
    player = create(:user)
    dungeon.run(player)

    expect(player.vitality).to eq(User::MAX_VITALITY - (dungeon.rooms.count * 20))
  end
end
