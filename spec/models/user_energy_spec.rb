require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  describe 'energy' do
    pending 'recharge energy over time'
    pending 'recharge energy faster in certain locations (restful ones)'

    describe 'spends energy' do
      let!(:old_energy) { user.energy }

      it 'cannot spend negative energy' do
        expect { user.spend_energy(-10) }.to raise_error(CraftyError)
      end

      it 'spends energy' do
        user.spend_energy(10)

        expect(user.energy).to eq(old_energy - 10)
      end

      it 'cannot spend more than the user has' do
        expect { user.spend_energy(old_energy + 1) }.to raise_error(CraftyError)
      end
    end

    describe 'adds energy' do
      before do
        user.update(energy: 10)
      end

      it 'adds energy' do
        user.add_energy(5)

        expect(user.energy).to eq(15)
      end

      it 'doesnt add past max' do
        user.add_energy(User::MAX_ENERGY)

        expect(user.energy).to eq(User::MAX_ENERGY)
      end

      it 'doesnt add negative energy' do
        expect { user.add_energy(-10) }.to raise_error(CraftyError)
      end
    end
  end
end
