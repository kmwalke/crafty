require 'rails_helper'

RSpec.describe Resource::Fruit do
  it 'gathers fruit' do
    expect(create(:fruit).gather.name).to eq('Fruit')
  end
end
