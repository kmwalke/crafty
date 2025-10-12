require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

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
    let(:user) { create(:user) }

    it 'energy' do
      expect(user.energy).to eq(User::DEFAULT_ENERGY)
    end

    it 'status' do
      expect(user.status).to eq(UserStatus::STATUSES[:resting])
    end

    it 'inventory' do
      expect(user.inventory).to be_a(Inventory)
    end
  end
end
