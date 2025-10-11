require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'vehicles' do
    let(:vehicle) { create(:vehicle, inventory: user.inventory) }

    before do
      user.equip_vehicle(vehicle)
    end

    it 'cannot equip a vehicle not in inventory' do
      bad_vehicle = create(:vehicle)

      user.equip_vehicle(bad_vehicle)

      expect(user.vehicle).not_to eq(bad_vehicle)
    end

    it 'equips a vehicle from inventory' do
      expect(user.vehicle).to eq(vehicle)
    end

    it 'lists available actions' do
      expect(user.actions).to eq(vehicle.actions)
    end

    it 'lists no actions without a vehicle' do
      user2 = create(:user)

      expect(user2.actions).to eq([])
    end

    it 'wont travel without a vehicle' do
      user2 = create(:user)

      expect(user2.travel(create(:location))).to be_nil
    end

    it 'travels between locations' do
      expect(vehicle).to receive(:travel)
      user.travel(create(:location))
    end
  end
end
