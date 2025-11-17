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
end
