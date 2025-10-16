require 'rails_helper'

RSpec.describe Resource::Forest do
  it 'gathers forest' do
    expect(create(:forest).gather.name).to eq('Wood')
  end
end
