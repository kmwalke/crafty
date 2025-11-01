require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }
  let(:vehicle) { create(:craftable_vehicle, inventory: user.inventory) }
  let(:gathering_tool) { create(:craftable_tool_gathering_tool, inventory: user.inventory) }

  describe 'actions' do
    it 'has no actions without equipment' do
      expect(user.actions).to eq([])
    end

    it 'combines actions from multiple pieces of equipment' do
      user.equip_item vehicle
      user.equip_item gathering_tool

      expect(user.actions).to eq(%w[gather travel])
    end

    describe 'tool' do
      before do
        user.equip_item gathering_tool
      end

      it 'removes equipped tool from inventory' do
        expect(user.inventory.items.include?(gathering_tool)).to be false
      end

      it 'equips the tool' do
        expect(user.actions).to eq(%w[gather])
      end

      describe 'unequips tool' do
        before do
          user.unequip_tool
        end

        it 'unequips the tool' do
          expect(user.actions).to eq([])
        end

        it 'adds the tool back to inventory' do
          expect(user.inventory.items.include?(gathering_tool)).to be true
        end
      end
    end
  end

  describe 'vehicle' do
    before do
      user.equip_item vehicle
    end

    it 'removes equipped vehicle from inventory' do
      expect(user.inventory.items.include?(vehicle)).to be false
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
        expect(user.inventory.items.include?(vehicle)).to be true
      end
    end
  end
end
