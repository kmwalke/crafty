require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }
  let(:vehicle) { create(:vehicle_hover_bike, parent_inventory: user.child_inventory) }
  let(:gathering_tool) { create(:gathering_tool, parent_inventory: user.child_inventory) }

  describe 'actions' do
    it 'has no actions without equipment' do
      expect(user.actions).to eq([])
    end

    it 'combines actions from multiple pieces of equipment' do
      user.equip_item vehicle
      user.equip_item gathering_tool

      expect(user.actions).to eq(%w[gather travel])
    end

    describe 'bag' do
      let(:bag) { create(:crafted_bag, parent_inventory: user.child_inventory) }

      before do
        user.equip_item bag
      end

      it 'removes equipped bag from inventory' do
        expect(user.child_inventory.items.include?(bag)).to be false
      end

      it 'replaces a bag with another' do
        bag2 = create(:crafted_bag, parent_inventory: user.child_inventory)
        user.equip_item bag2
        expect(user.child_inventory.items.include?(bag)).to be true
      end

      describe 'unequips bag' do
        before do
          user.unequip_bag
        end

        it 'unequips the bag' do
          expect(user.actions).to eq([])
        end

        it 'adds the bag back to inventory' do
          expect(user.child_inventory.items.include?(bag)).to be true
        end
      end
    end

    describe 'tool' do
      before do
        user.equip_item gathering_tool
      end

      it 'removes equipped tool from inventory' do
        expect(user.child_inventory.items.include?(gathering_tool)).to be false
      end

      it 'equips the tool' do
        expect(user.actions).to eq(%w[gather])
      end

      it 'replaces a tool with another' do
        gathering_tool2 = create(:gathering_tool, parent_inventory: user.child_inventory)
        user.equip_item gathering_tool2
        expect(user.child_inventory.items.include?(gathering_tool)).to be true
      end

      describe 'unequips tool' do
        before do
          user.unequip_tool
        end

        it 'unequips the tool' do
          expect(user.actions).to eq([])
        end

        it 'adds the tool back to inventory' do
          expect(user.child_inventory.items.include?(gathering_tool)).to be true
        end
      end
    end
  end

  describe 'vehicle' do
    before do
      user.equip_item vehicle
    end

    it 'removes equipped vehicle from inventory' do
      expect(user.child_inventory.items.include?(vehicle)).to be false
    end

    it 'equips the vehicle' do
      expect(user.actions).to eq(%w[travel])
    end

    describe 'unequips vehicle' do
      before do
        user.unequip_vehicle
      end

      it 'unequips the vehicle' do
        expect(user.actions).to eq([])
      end

      it 'adds the vehicle back to inventory' do
        expect(user.child_inventory.items.include?(vehicle)).to be true
      end
    end
  end
end
