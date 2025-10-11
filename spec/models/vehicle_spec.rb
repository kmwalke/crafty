require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  let(:vehicle) { create(:vehicle) }

  it 'lists actions' do
    expect(vehicle.actions).to eq(%w[travel])
  end

  describe 'travels' do
    let(:location1) { create(:location) }
    let(:location2) { create(:location) }
    let(:user) { create(:user, location: location1) }
    let(:vehicle) { create(:vehicle, inventory: user.inventory) }


    before :each do
      user.equip_vehicle(vehicle)
    end

    pending 'updates status to traveling'
    pending 'takes time to travel. high level vehicles are faster'
    pending 'sets status to resting on arrival'

    it 'nil user protection' do
      expect(create(:vehicle).travel(location2)).to eq(nil)

    end

    it 'updates the users location' do
      vehicle.travel(location2)

      expect(user.location).to eq(location2)
    end

    describe 'spends the users energy' do
      let(:old_energy) { user.energy }
      let(:low_energy) { old_energy - (location1.distance_from(location2)) }

      it 'low level vehicle' do
        vehicle.update(level: 0)

        vehicle.travel(location2)

        expect(user.energy).to be < low_energy
      end

      it 'high level vehicle' do
        vehicle.update(level: 4)

        vehicle.travel(location2)

        expect(user.energy).to be_between(low_energy, old_energy).exclusive
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
