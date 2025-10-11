require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'inventory' do
    let(:item) { create(:item) }

    describe 'trading', skip: 'not built' do
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
end
