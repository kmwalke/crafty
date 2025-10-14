require 'rails_helper'

RSpec.describe 'Gathering' do
  let!(:player) { login }
  let!(:local_resource1) { create(:resource, location: player.location) }
  let!(:local_resource2) { create(:resource, location: player.location) }
  let!(:distant_resource) { create(:resource) }

  before do
    visit game_path
  end

  it 'displays the location\'s resources' do
    [local_resource1, local_resource2].each do |resource|
      expect(page).to have_content resource.name
    end
  end

  it 'lists gatherable resources as links' do
  end

  it 'lists non-gatherable resources as spans' do
  end

  it 'does not display distant resources' do
    expect(page).to have_no_content distant_resource.name
  end

  it 'gathers resources' do
    # expect(true).to be false
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

  it 'adds resources to inventory' do
  end
end
