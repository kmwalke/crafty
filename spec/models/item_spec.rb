require 'rails_helper'

RSpec.describe Item do
  let(:item) { create(:generic_item) }
  let(:vehicle) { create(:craftable_vehicle) }

  pending 'items can stack if marked as stackable'

  it 'shows the level name' do
    expect(item.level_name).to eq(Level.level_name(item.level))
  end

  it 'items are not equipable' do
    expect(item.equipable?).to be false
  end
end
