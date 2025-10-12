require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  describe 'energy' do
    pending 'recharge energy with items'
    pending 'recharge energy over time'
    pending 'recharge energy faster in certain locations (restful ones)'

    describe 'spends energy' do
      let!(:old_energy) { user.energy }

      it 'cannot spend negative energy' do
        user.spend_energy(-10)

        expect(user.energy).to eq(old_energy)
      end

      it 'spends energy' do
        user.spend_energy(10)

        expect(user.energy).to eq(old_energy - 10)
      end

      it 'cannot spend more than the user has' do
        user.spend_energy(old_energy + 1)

        expect(user.energy).to eq(old_energy)
      end
    end
  end
end
