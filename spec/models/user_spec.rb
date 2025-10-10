require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'requires a name' do
      expect(described_class.create(name: '').errors).to have_key(:name)
    end

    it 'requires an email' do
      expect(described_class.create(email: '').errors).to have_key(:email)
    end

    it 'requires email uniqueness' do
      user = create(:user)
      expect { create(:user, email: user.email) }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'requires a status' do
      expect(described_class.create(status: '').errors).to have_key(:status)
    end
  end

  describe 'defaults' do
    it 'energy' do
      user = create(:user)
      expect(user.energy).to eq(User::DEFAULT_ENERGY)
    end

    it 'status' do
      user = create(:user)
      expect(user.status).to eq(UserStatus::STATUSES[:resting])
    end
  end

  describe 'actions' do
    let(:user) { create(:user) }

    it 'cannot equip a vehicle not in inventory' do
      vehicle = create(:vehicle)

      user.equip_vehicle(vehicle)

      expect(user.reload.vehicle).not_to eq(vehicle)
    end

    it 'equips a vehicle from inventory' do
      vehicle = create(:vehicle)

      user.add_to_inventory(vehicle)
      user.equip_vehicle(vehicle)

      expect(user.reload.vehicle).to eq(vehicle)
    end

    it 'lists available actions' do
      # user.actions = ['travel', 'mine', 'refine', etc]
      # equipment gives the user actions
      # vehicles allow travel
      # mines allow mining
      # refiners allow refining
      # crafting equipment allows building things
      expect(true).to be(false)
    end

    it 'travels between locations' do
      # travel between locations
      # Costs energy based on distance
      # use less energy if on vehicle
      # energy recharges over time?
      # Items to recharge energy?
      # later it will take time, too
      # Actually, always requires a vehicle.  User starts with the vehicle "shoes".
      #     That way, "traveling" is always an action of the vehicle, not the user
      expect(true).to be(false)
    end
  end
end
