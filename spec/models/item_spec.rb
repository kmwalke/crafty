require 'rails_helper'

RSpec.describe Item do
  let(:item) { create(:generic_item) }
  let(:vehicle) { create(:craftable_vehicle) }

  it 'shows the level name' do
    expect(item.level_name).to eq(Level.level_name(item.level))
  end

  it 'items are not equipable' do
    expect(item.equipable?).to be false
  end

  it 'shows the full name' do

  end

  it 'is private' do

  end
end
