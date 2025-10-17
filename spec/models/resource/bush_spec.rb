require 'rails_helper'

RSpec.describe Resource::Bush do
  it 'gathers fruit' do
    expect(create(:bush).gather).to be_a(Item::Gatherable::Fruit)
  end
end
