require 'rails_helper'

RSpec.describe Inventory do
  let(:inventory) { create(:inventory, size: 1) }

  pending 'sorts the inventory'
  pending 'equipping a backpack or something increases the users inventory size'

  it 'gets a count of current items' do
    expect(inventory.count).to eq(inventory.items.count)
  end

  it 'gets a count of remaining space' do
    expect(inventory.remaining_space).to eq(inventory.size - inventory.count)
  end

  describe 'must belong to a user or a location' do
    it 'user || location' do
      expect { create(:inventory, user: nil, location: nil) }.to raise_error(CraftyError)
    end

    it 'but not both' do
      expect { create(:inventory, location: create(:location), user: create(:user)) }.to raise_error(CraftyError)
    end
  end

  it 'limits contents to inventory size' do
    inventory.add_item(Item.new(name: 'one', description: 'desc', created_by: inventory.user, level: Level::COMMON))
    expect do
      inventory.add_item(Item.new(name: 'two', description: 'desc', created_by: inventory.user, level: Level::COMMON))
    end.to raise_error(CraftyError)
  end

  it 'wont add saved items' do
    expect { inventory.add_item(create(:item)) }.to raise_error(CraftyError)
  end

  it 'only adds unsaved items' do
    expect { inventory.add_item(build(:item)) }.to raise_error(CraftyError)
  end
end
