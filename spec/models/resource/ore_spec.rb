require 'rails_helper'

RSpec.describe Resource::Ore do
  it 'gathers ore' do
    expect(create(:ore).gather).to be_a(Item::Gatherable::Ore)
  end
end
