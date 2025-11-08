require 'rails_helper'

RSpec.describe Location do
  let!(:location) { create(:location) }

  it 'requires a name' do
    expect(described_class.create(name: '').errors).to have_key(:name)
  end

  it 'requires a pos_x' do
    expect(described_class.create(pos_x: '').errors).to have_key(:pos_x)
  end

  it 'requires a pos_y' do
    expect(described_class.create(pos_y: '').errors).to have_key(:pos_y)
  end

  it 'requires a description' do
    expect(described_class.create(description: '').errors).to have_key(:description)
  end

  it 'requires name uniqueness' do
    expect { create(:location, name: location.name) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'creates an inventory' do
    expect(location.property).to be_a(Inventory)
  end

  it 'adds a building' do
    old_count = location.property.count

    location.add_building(build(:craftable_building, parent_inventory: nil))

    expect(location.property.count).to eq(old_count + 1)
  end

  it 'does not add other items to buildings' do
    expect { location.add_building(build(:gatherable_fruit)) }.to raise_error CraftyError
  end

  it 'calculates distance between locations' do
    location2 = create(:location)

    distance = Math.sqrt((((location2.pos_x - location.pos_x)**2) - ((location2.pos_y - location.pos_y)**2)).abs).round

    expect(location.distance_from(location2)).to eq(distance)
    expect(location2.distance_from(location)).to eq(distance)
  end
end
