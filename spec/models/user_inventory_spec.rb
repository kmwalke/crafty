require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }

  describe 'inventory' do
    let(:item) { create(:gatherable_fish, inventory: user.inventory) }

    describe 'stores' do
      let!(:listing) do
        create(
          :listing,
          price_amount: item.stack_amount,
          price_type: item.type,
          price_level: item.level
        )
      end
      let(:listed_item) { listing.item }

      it 'purchases a listing' do
        user.purchase(listing, item)
        expect(user.inventory.include?(listed_item)).to be true
      end

      it 'removes the listing' do
        listing_id = listing.id
        user.purchase(listing, item)
        expect { Listing.find(listing_id) }.to raise_error ActiveRecord::RecordNotFound
      end

      it 'requires proper payment' do
        listing.update(price_amount: listing.price_amount + 1)
        expect { user.purchase(listing, item) }.to raise_error CraftyError
      end

      it 'splits stack if overpaid' do
        item.update(stack_amount: item.stack_amount + 1)
        user.purchase(listing, item)
        expect(item.reload.stack_amount).to eq(1)
      end
    end

    pending 'user trading'
    # describe 'trading', skip: 'not built' do
    #   describe 'gifts item to another user' do
    #     before do
    #       user2 = create(:user)
    #
    #       user2.add_to_inventory(item)
    #
    #       user2.trade(
    #         user: user,
    #         export: [item],
    #         import: nil
    #       )
    #     end
    #
    #     it 'adds to giftee inventory' do
    #       expect(user.inventory.include?(item)).to be_true
    #     end
    #
    #     it 'removes from gifter inventory' do
    #       expect(user2.inventory.include?(item)).to be_false
    #     end
    #   end
    #
    #   describe 'trades with another user' do
    #     before do
    #       user2 = create(:user)
    #       item2 = create(:item)
    #       item3 = create(:item)
    #
    #       user.add_to_inventory(item)
    #       user2.add_to_inventory(item2)
    #       user2.add_to_inventory(item3)
    #
    #       user.trade(
    #         user: user2,
    #         export: [item],
    #         import: [item2, item3]
    #       )
    #     end
    #
    #     it 'adds items to user' do
    #       expect(Set[item2, item3].subset?(user.inventory.to_set)).to be_true
    #     end
    #
    #     it 'removes item from user' do
    #       expect(user2.inventory.include?(item)).to be_true
    #     end
    #   end
    # end
  end
end
