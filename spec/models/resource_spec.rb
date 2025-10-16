require 'rails_helper'

RSpec.describe Resource do
  let!(:resource) { create(:resource) }
  let!(:crystal) { create(:crystal) }
  let!(:fish) { create(:fish) }
  let!(:forest) { create(:forest) }
  let!(:fruit) { create(:fruit) }
  let!(:herd) { create(:herd) }
  let!(:meadow) { create(:meadow) }
  let!(:ore) { create(:ore) }

  it 'doesnt gather from a generic resource' do
    expect { resource.gather }.to raise_error(RuntimeError)
  end

  it 'gathers crystal' do
    expect(crystal.gather.name).to eq('Crystal')
  end

  it 'gathers fish' do
    expect(fish.gather.name).to eq('Fish')
  end

  it 'gathers forest' do
    expect(forest.gather.name).to eq('Wood')
  end

  it 'gathers fruit' do
    expect(fruit.gather.name).to eq('Fruit')
  end

  it 'gathers herd' do
    expect(herd.gather.name).to eq('Pelt')
  end

  it 'gathers meadow' do
    expect(meadow.gather.name).to eq('Flower')
  end

  it 'gathers ore' do
    expect(ore.gather.name).to eq('Ore')
  end
end
