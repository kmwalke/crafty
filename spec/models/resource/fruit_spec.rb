require 'rails_helper'

RSpec.describe Resource::Fruit do
  it 'gathers fruit' do
    expect(create(:fruit).gather).to be_a(Item::Gatherable::Fruit)
  end
end
