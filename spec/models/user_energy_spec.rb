require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'energy' do
    pending 'recharge energy with items'
    pending 'recharge energy over time'
    pending 'recharge energy faster in certain locations (restful ones)'

    describe 'spends energy' do
      pending 'expect error thrown if negative energy. All this stuff shouldnt fail silently'

      it 'cannot spend negative energy' do
        old_energy = user.energy

        user.spend_energy(-10)

        expect(user.energy).to eq(old_energy)
      end

      it 'spends energy' do
        old_energy = user.energy

        user.spend_energy(10)

        expect(user.energy).to eq(old_energy - 10)
      end
    end
  end
end
