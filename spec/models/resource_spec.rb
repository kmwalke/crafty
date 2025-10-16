require 'rails_helper'

RSpec.describe Resource do
  let!(:resource) { create(:resource) }

  it 'doesnt gather from a generic resource' do
    expect { resource.gather }.to raise_error(RuntimeError)
  end

  it 'gathers crystal' do
    expect(create(:crystal).gather.name).to eq('Crystal')
  end

  it 'gathers fish' do
    expect(create(:fish).gather.name).to eq('Fish')
  end

  it 'gathers forest' do
    expect(create(:forest).gather.name).to eq('Wood')
  end

  it 'gathers fruit' do
    expect(create(:fruit).gather.name).to eq('Fruit')
  end

  it 'gathers herd' do
    expect(create(:herd).gather.name).to eq('Pelt')
  end

  it 'gathers meadow' do
    expect(create(:meadow).gather.name).to eq('Flower')
  end

  it 'gathers ore' do
    expect(create(:ore).gather.name).to eq('Ore')
  end
end
