require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }
  let(:vehicle) { create(:craftable_vehicle, inventory: user.inventory) }
  let(:gathering_tool) { create(:gathering_tool, inventory: user.inventory) }

  describe 'actions' do
    # instead of user.gather or user.travel
    # something like
    # user.do(action = 'gather', arg = resource)
    # def user.do(action, arg)
    #  tool.send(action, arg)  # tool.send('gather', resource) or tool.send('craft', craft_params)
    # end
    pending 'v0.2 replace various user action methods with send'

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

      it 'replaces a tool with another' do
        gathering_tool2 = create(:gathering_tool, inventory: user.inventory)
        user.equip_item gathering_tool2
        expect(user.inventory.items.include?(gathering_tool)).to be true
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
