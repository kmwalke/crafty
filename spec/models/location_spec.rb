require 'rails_helper'

RSpec.describe Location do
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
    location = create(:location)
    expect { create(:location, name: location.name) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'calculates distance between locations' do
    loc1 = create(:location)
    loc2 = create(:location)

    distance = Math.sqrt(
      (
        ((loc2.pos_x - loc1.pos_x)**2) -
          ((loc2.pos_y - loc1.pos_y)**2)
      ).abs
    ).round

    expect(loc1.distance_from(loc2)).to eq(distance)
    expect(loc2.distance_from(loc1)).to eq(distance)
  end
end
