require 'rails_helper'

RSpec.describe 'Gathering' do
  let!(:player) { login }
  let!(:location) { create(:location) }

  before do
    visit game_path
  end

  it 'displays the location\'s resources' do
    expect(true).to be false
  end

  it 'gathers resources' do
    expect(true).to be false
  #   Multiple types of tools
  # Axe gathers lumber from trees
  # sheers gather wool
  # pickaxe gathers ores
  # secateurs gather herbs/fruits
  # etc...
  # various tools inherit from Tool class
  # Use subtype, somehow.  Maybe polymorphism, maybe just a method that checks it
  # add equipping tools to equipment spec
  end

  it 'adds gathered resources to inventory' do
    expect(true).to be false
  end

  it 'checks the various types of tools' do
    expect(true).to be false
  end
end
