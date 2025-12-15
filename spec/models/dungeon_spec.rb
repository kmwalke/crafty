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

  describe 'runs a dungeon' do
    let(:player) { create(:user) }

    before do
      dungeon.run(player)
    end

    it 'subtracts health for v1' do
      expect(player.vitality).to eq(User::MAX_VITALITY - (dungeon.rooms.count * 20))
    end

    it 'gives the player a reward' do
      pending 'not implemented'
      expect(player.carried_items.include?(dungeon.reward)).to be true
    end
  end
end
