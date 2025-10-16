require 'rails_helper'

RSpec.describe Resource::Meadow do
  it 'gathers meadow' do
    expect(create(:meadow).gather).to be_a(Item::Gatherable::Flower)
  end
end
