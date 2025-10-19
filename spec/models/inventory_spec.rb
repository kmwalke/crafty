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
    inventory.add_item(build(:gatherable_fruit, inventory: nil))
    expect do
      inventory.add_item(build(:item, inventory: nil))
    end.to raise_error(CraftyError)
  end

  it 'wont add saved items' do
    expect { inventory.add_item(create(:gatherable_fruit)) }.to raise_error(CraftyError)
  end

  it 'only adds unsaved items' do
    expect { inventory.add_item(build(:gatherable_fruit)) }.to raise_error(CraftyError)
  end

<<<<<<< Updated upstream
=======
  it 'stacks items' do
    inventory.add_item(build(:gatherable_fruit, level: Level::COMMON, name: 'name', inventory: nil))
    inventory.update(size: inventory.count)
    inventory.add_item(build(:gatherable_fruit, level: Level::COMMON, name: 'name', inventory: nil))

    expect(inventory.items.last.stack_amount).to eq(2)
  end

>>>>>>> Stashed changes
  describe 'restricted inventories' do
    let(:shard_inv) { create(:inventory, type: ItemType::TYPES[:gatherable_shard]) }

    it 'puts allowed items in' do
      item = build(:gatherable_shard, inventory: nil)
      shard_inv.add_item(item)

      expect(shard_inv.include?(item)).to be true
    end

    it 'disallows other items' do
      item = build(:gatherable_fruit, inventory: nil)

      expect { shard_inv.add_item(item) }.to raise_error(CraftyError)
    end
  end
end
