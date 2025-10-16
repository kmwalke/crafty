require 'rails_helper'

RSpec.describe Resource::Meadow do
  it 'gathers meadow' do
    expect(create(:meadow).gather.name.include?('Flower')).to be true
  end
end
