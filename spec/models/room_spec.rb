require 'rails_helper'

RSpec.describe Room do
  it 'has a dungeon' do
    expect(create(:room).dungeon).to be_a Dungeon
  end

  it 'runs the room' do
    player = create(:user)

    create(:room).run(player)

    expect(player.vitality).to eq(User::MAX_VITALITY - 20)
  end
end
