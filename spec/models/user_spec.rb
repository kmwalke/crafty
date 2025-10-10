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

    describe 'inventory' do
      let(:item) { create(:item) }

      it 'picks up items' do
        user.add_to_inventory(item)

        expect(user.inventory.include? item).to be_true
      end

      it 'cannot remove item from other user' do
        user2 = create(:user)

        user2.add_to_inventory(item)
        user.add_to_inventory(item)

        expect(user.inventory.include? item).to be_false
      end

      describe 'trading', skip: 'not built. this file is gonna be big.  SPlit into another file?  Make userspec a folder?' do
        it 'gifts item to another user' do
          before :each do
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
          before :each do
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
            expect(Set[item2, item3].subset? user.inventory.to_set).to be_true
          end

          it 'removes item from user' do
            expect(user2.inventory.include? item).to be_true
          end
        end
      end
    end

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
