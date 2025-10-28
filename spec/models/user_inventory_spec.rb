require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user, credits: 1000) }

  describe 'inventory' do
    let(:item) { create(:gatherable_fish, inventory: user.inventory) }

    describe 'stores' do
      let!(:listing) { create(:listing, price: 1) }
      let(:listed_item) { listing.item }

      it 'purchases a listing' do
        user.purchase(listing)
        expect(user.inventory.include?(listed_item)).to be true
      end

      it 'pays for the listing' do
        old_creds = user.credits
        price     = listing.price

        user.purchase(listing)
        expect(user.credits).to eq(old_creds - price)
      end

      it 'removes the listing' do
        listing_id = listing.id
        user.purchase(listing)
        expect { Listing.find(listing_id) }.to raise_error ActiveRecord::RecordNotFound
      end

      it 'requires proper payment' do
        listing.update(price: user.credits + 1)

        expect { user.purchase(listing) }.to raise_error CraftyError
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
