require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  let(:vehicle) { create(:vehicle) }

  it 'lists actions' do
    expect(vehicle.actions).to eq(%w[travel])
  end

  it 'travels between locations' do
    # travel between locations
    # Costs energy based on distance
    # use less energy if on vehicle, better vehicles use less energy
    # energy recharges over time?
    # Items to recharge energy?
    # later it will take time, too
    # Actually, always requires a vehicle.  User starts with the vehicle "shoes".
    #     That way, "traveling" is always an action of the vehicle, not the user
    expect(true).to be(false)
  end
end
