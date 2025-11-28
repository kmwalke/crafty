require 'rails_helper'

RSpec.describe Room do
  it 'has a dungeon' do
    expect(create(:room).dungeon).to be_a Dungeon
  end
end
