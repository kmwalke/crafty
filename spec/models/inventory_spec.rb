require 'rails_helper'

RSpec.describe Inventory do
  let(:inventory) { create(:inventory, size: 1) }

  pending 'sorts the inventory'
  pending 'equipping a backpack or something increases the users inventory size'

  it 'must belong to a user' do
    expect { create(:inventory, user: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'limits contents to inventory size' do
    inventory.add_item(Item.new(name: 'one', description: 'desc', created_by: inventory.user, level: Level::COMMON))
    inventory.add_item(Item.new(name: 'two', description: 'desc', created_by: inventory.user, level: Level::COMMON))

    expect(inventory.items.count).to eq(1)
  end

  it 'wont add saved items' do
    expect(inventory.add_item(create(:item))).to be false
  end

  it 'only adds unsaved items' do
    expect(inventory.add_item(build(:item))).to be true
  end
end
