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

    it 'requires a location' do
      expect(described_class.create(location_id: '').errors).to have_key(:location_id)
    end
  end

  describe 'defaults' do
    it 'energy' do
      user = create(:user)
      expect(user.energy).to eq(User::DEFAULT_ENERGY)
    end

    it 'location' do
      # user must exist somewhere in the world
      # default to starting city
      # try do do something other than hardcoding this
      # maybe a flag on the location "spawn point"
      expect(true).to be(false)
    end

    it 'status' do
      user = create(:user)
      expect(user.status).to eq(User::STATUSES[:resting])
    end
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
