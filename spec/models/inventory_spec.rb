require 'rails_helper'

RSpec.describe Inventory do
  let(:inventory) { create(:inventory, size: 1) }

  pending 'version_0.3 craftable backpack item. Has an inventory'

  it 'gets a count of current items' do
    expect(inventory.count).to eq(inventory.items.count)
  end

  it 'gets a count of remaining space' do
    expect(inventory.remaining_space).to eq(inventory.size - inventory.count)
  end

  it 'limits contents to inventory size' do
    inventory.add_item(build(:gatherable_fruit, parent_inventory: nil))
    expect do
      inventory.add_item(build(:item, parent_inventory: nil))
    end.to raise_error(CraftyError)
  end

  it 'wont add saved items' do
    expect { inventory.add_item(create(:gatherable_fruit)) }.to raise_error(CraftyError)
  end

  it 'only adds unsaved items' do
    expect { inventory.add_item(build(:gatherable_fruit)) }.to raise_error(CraftyError)
  end

  describe 'restricted inventories' do
    let(:shard_inv) { create(:inventory, type: ItemType::GATHERABLE[:shard]) }

    it 'puts allowed items in' do
      item = build(:gatherable_shard, parent_inventory: nil)
      shard_inv.add_item(item)

      expect(shard_inv.include?(item)).to be true
    end

    it 'disallows other items' do
      item = build(:gatherable_fruit, parent_inventory: nil)

      expect { shard_inv.add_item(item) }.to raise_error(CraftyError)
    end
  end
end
