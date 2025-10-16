require 'rails_helper'

RSpec.describe 'Gathering' do
  let!(:player) { login }
  let!(:gathering_tool) { create(:gathering_tool, inventory: player.inventory) }
  let!(:local_resource) { create(:resource, location: player.location) }

  before do
    player.equip_item(gathering_tool)
  end

  it 'displays the location\'s resources' do
    local_resource2 = create(:resource, location: player.location)
    visit game_path
    [local_resource, local_resource2].each do |resource|
      expect(page).to have_content resource.name
    end
  end

  it 'does not display distant resources' do
    distant_resource = create(:resource)
    visit game_path
    expect(page).to have_no_content distant_resource.name
  end

  describe 'gathers resources' do
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
    # currently using placeholder items.  Just a plain Item with a name of the type
    # later it will be Item::Ore::Copper or Item::Flower::Dandelion
    let!(:old_inv_count) { player.inventory.items.count }

    before do
      gather_resource
    end

    it 'adds resources to inventory' do
      expect(player.reload.inventory.items.count).to eq(old_inv_count + 1)
    end

    describe 'does not overfill the inventory' do
      before do
        player.inventory.update(size: old_inv_count)
        gather_resource
      end

      it 'doesnt add to the inventory' do
        expect(player.reload.inventory.size).to eq(old_inv_count)
      end

      it 'shows the error' do
        expect(page).to have_css('div.notice-popup', text: ErrorMessage::INVENTORY[:no_space])
      end
    end
  end
end

def gather_resource
  visit game_path
  within '.actions' do
    click_link 'Gather'
    click_link local_resource.name
  end
end
