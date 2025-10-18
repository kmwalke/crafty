require 'rails_helper'

RSpec.describe Resource::Forest do
  it 'gathers forest' do
    expect(create(:forest).gather).to be_a(Item::Gatherable::Wood)
  end
end
