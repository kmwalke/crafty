require 'rails_helper'

RSpec.describe Resource::Ore do
  it 'gathers ore' do
    expect(create(:ore).gather.name.include?('Ore')).to be true
  end
end
