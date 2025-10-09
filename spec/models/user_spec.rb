require 'rails_helper'

RSpec.describe User, type: :model do
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

  it 'requires a location' do
    # user must exist somewhere in the world
    # default to starting city
    # try do do something other than hardcoding this
    # maybe a flag on the location "spawn point"
  end

  it 'travels between locations', skip: 'not built' do
    # travel between locations
    # Costs energy based on distance
    # use less energy if on vehicle
    # energy recharges over time?
    # Items to recharge energy?
    # later it will take time, too
  end

  it 'has a status' do
    # default to resting
  end
end
