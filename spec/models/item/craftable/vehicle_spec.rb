require 'rails_helper'

RSpec.describe Item::Craftable::Vehicle do
  let(:vehicle) { create(:craftable_vehicle) }

  it 'lists actions' do
    expect(vehicle.actions).to eq(%w[travel])
  end

  describe 'travels' do
    let(:location1) { create(:location) }
    let(:location2) { create(:location) }
    let(:user) { create(:user, location: location1) }
    let(:vehicle) { create(:craftable_vehicle, inventory: user.inventory) }

    before do
      user.equip_item(vehicle)
    end

    pending 'version_0.7 updates status to traveling'
    pending 'version_0.7 takes time to travel. high level vehicles are faster'
    pending 'version_0.7 sets status to resting on arrival'

    it 'vehicles are equippable' do
      expect(vehicle.equippable?).to be true
    end

    it 'nil user protection' do
      expect { create(:craftable_vehicle).travel(location2) }.to raise_error(CraftyError)
    end

    it 'updates the users location' do
      vehicle.travel(location2)

      expect(user.reload.location).to eq(location2)
    end

    it 'doesn\'t update if user has low energy' do
      user.update(energy: 0)

      expect { vehicle.travel(location2) }.to raise_error(CraftyError)
    end

    describe 'spends the users energy' do
      let!(:low_energy) { user.energy - location1.distance_from(location2) }

      it 'low level vehicle' do
        vehicle.update(level: Level::COMMON)

        vehicle.travel(location2)

        expect(user.reload.energy < low_energy).to be true
      end

      it 'mid level vehicle' do
        vehicle.update(level: Level::RARE)

        vehicle.travel(location2)

        expect(user.reload.energy).to eq(low_energy)
      end

      it 'high level vehicle' do
        old_energy = user.energy

        vehicle.update(level: Level::EPIC)

        vehicle.travel(location2)

        expect(user.reload.energy).to be_between(low_energy, old_energy).exclusive
      end
    end
  end
end
