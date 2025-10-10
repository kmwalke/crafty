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

  describe 'actions' do
    let(:user) { create(:user) }

    pending 'combine actions from multiple pieces of equipment'

    describe 'inventory' do
      let(:item) { create(:item) }

      describe 'trading',
               skip: 'not built. this file is gonna be big.  Split into another file?  Make userspec a folder?' do
        it 'gifts item to another user' do
          before do
            user2 = create(:user)

            user2.add_to_inventory(item)

            user2.trade(
              user: user,
              export: [item],
              import: nil
            )
          end

          it 'adds to giftee inventory' do
            expect(user.inventory.include?(item)).to be_true
          end

          it 'removes from gifter inventory' do
            expect(user2.inventory.include?(item)).to be_false
          end
        end

        it 'trades with another user' do
          before do
            user2 = create(:user)
            item2 = create(:item)
            item3 = create(:item)

            user.add_to_inventory(item)
            user2.add_to_inventory(item2)
            user2.add_to_inventory(item3)

            user.trade(
              user: user2,
              export: [item],
              import: [item2, item3]
            )
          end

          it 'adds items to user' do
            expect(Set[item2, item3].subset?(user.inventory.to_set)).to be_true
          end

          it 'removes item from user' do
            expect(user2.inventory.include?(item)).to be_true
          end
        end
      end
    end

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
end
