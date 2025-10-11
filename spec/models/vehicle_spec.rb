require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  let(:vehicle) { create(:vehicle) }

  it 'lists actions' do
    expect(vehicle.actions).to eq(%w[travel])
  end

  describe 'travels' do

    pending 'updates status to traveling'
    pending 'takes time to travel. high level vehicles are faster'
    pending 'sets status to resting on arrival'

    it 'updates the users location' do

    end

    describe 'spends the users energy' do

      it 'low level vehicle' do

      end

      it 'high level vehicle' do

      end

    end
    # travel between locations
    # Costs energy based on distance
    # use less energy if on vehicle, better vehicles use less energy
    # energy recharges over time?
    # Items to recharge energy?
    # later it will take time, too
    # Actually, always requires a vehicle.  User starts with the vehicle "shoes".
    #     That way, "traveling" is always an action of the vehicle, not the user
    # expect(true).to be(false)
  end
end
