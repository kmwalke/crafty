require 'rails_helper'

RSpec.describe User do
  let(:player) { create(:user) }
  let(:bike) { create(:vehicle_hover_bike, parent_inventory: player.inventory) }
  let(:mount) { create(:vehicle_mount, parent_inventory: player.inventory) }

  it 'adds to the user inventory' do
    item = create(:gatherable_fruit, parent_inventory: nil)
    player.add_item(item)

    expect(player.inventory.items.include?(item)).to be true
  end

  it 'adds to the vehicle inventory' do
    item = create(:gatherable_fruit, parent_inventory: nil)
    player.equip_item(bike)
    player.add_item(item)

    expect(player.vehicle.child_inventory.items.include?(item)).to be true
  end

  it 'adds to user inventory if vehicle inventory full' do
    item = create(:gatherable_fruit, parent_inventory: nil)
    bike.child_inventory.update(size: bike.child_inventory.count)
    player.equip_item(bike)
    player.add_item(item)

    expect(player.inventory.items.include?(item)).to be true
  end

  it 'adds to user inventory if vehicle has no inventory' do
    item = create(:gatherable_fruit, parent_inventory: nil)
    player.equip_item(mount)
    player.add_item(item)

    expect(player.inventory.items.include?(item)).to be true
  end

  it 'removes from inventory' do
    item = create(:gatherable_fruit, parent_inventory: player.inventory)
    player.remove_item(item)

    expect(player.inventory.items.include?(item)).to be false
  end

  it 'removes from vehicle inventory' do
    player.equip_item(bike)
    item = create(:gatherable_fruit, parent_inventory: player.vehicle.child_inventory)
    player.remove_item(item)

    expect(player.vehicle.child_inventory.items.include?(item)).to be false
  end

  describe 'carried items' do
    let!(:item1) { create(:gatherable_fruit, parent_inventory: player.inventory) }
    let!(:item2) { create(:gatherable_fruit, parent_inventory: bike.child_inventory) }

    it 'player inventory' do
      expect(player.carried_items.include?(item1)).to be true
    end

    it 'vehicle inventory' do
      expect(player.carried_items.include?(item2)).to be false
    end

    describe 'with vehicle' do
      before do
        player.equip_item(bike)
      end
      # player.carried_items == player.inventory.items + player.vehicle.child_inventory.items

      it 'player inventory' do
        expect(player.carried_items.include?(item1)).to be true
      end

      it 'vehicle inventory' do
        expect(player.carried_items.include?(item2)).to be true
      end
    end
  end
end
