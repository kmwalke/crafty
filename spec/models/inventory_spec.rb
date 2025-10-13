require 'rails_helper'

RSpec.describe Inventory do
  let(:inventory) { create(:inventory, size: 1) }

  pending 'sorts the inventory'
  pending 'equipping a backpack or something increases the users inventory size'

  it 'limits contents to inventory size' do
    inventory.add_item(name: 'one', description: 'desc', created_by: inventory.user, level: 0)
    inventory.add_item(name: 'two', description: 'desc', created_by: inventory.user, level: 0)

    expect(inventory.items.count).to eq(1)
  end

  it 'must belong to a user' do
    expect { create(:inventory, user: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
