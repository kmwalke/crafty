require 'rails_helper'

RSpec.describe Resource::Crystal do
  it 'gathers crystal' do
    expect(create(:crystal).gather.name.include?('Shard')).to be true
  end
end
