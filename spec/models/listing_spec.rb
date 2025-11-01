require 'rails_helper'

RSpec.describe Listing do
  describe 'purchase a listing' do
    let(:buyer) { create(:user) }
    let(:seller) { create(:user) }
    let(:listing) { create(:listing, created_by: seller) }

    it 'deducts credits from buyer' do
      new_buyer_creds = buyer.credits - listing.price
      listing.purchase(buyer)
      expect(buyer.credits).to eq(new_buyer_creds)
    end

    it 'delivers item to buyer' do
      listing.purchase(buyer)
      expect(buyer.inventory.items.include?(listing.item)).to be true
    end

    it 'pays the seller' do
      new_seller_creds = seller.credits + listing.price
      listing.purchase(buyer)
      expect(seller.credits).to eq(new_seller_creds)
    end

    it 'deletes the listing' do
      listing.purchase(buyer)
      expect(described_class.find_by(id: listing.id)).to be_nil
    end

    describe 'blocks sale if cannot afford' do
      let!(:new_buyer_creds) { buyer.credits }
      let!(:new_seller_creds) { seller.credits }

      before do
        listing.update(price: buyer.credits + 1)
        begin
          listing.purchase(buyer)
        rescue CraftyError
          nil
        end
      end

      it 'doesnt deduct credits from buyer' do
        expect(buyer.credits).to eq(new_buyer_creds)
      end

      it 'doesnt deliver item to buyer' do
        expect(buyer.inventory.items.include?(listing.item)).to be false
      end

      it 'doesnt pay the seller' do
        expect(seller.credits).to eq(new_seller_creds)
      end

      it 'doesnt delete the listing' do
        expect(described_class.find_by(id: listing.id)).to eq(listing)
      end
    end
  end
end
