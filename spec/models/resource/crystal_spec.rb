require 'rails_helper'

RSpec.describe Resource::Crystal do
  it 'gathers crystal' do
    expect(create(:crystal).gather).to be_a Item::Gatherable::Shard
  end
end
