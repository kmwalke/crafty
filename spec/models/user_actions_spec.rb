require 'rails_helper'

RSpec.describe User do
  let(:user) { create(:user) }
  let(:vehicle) { create(:vehicle, inventory: user.inventory) }
  let(:gathering_tool) { create(:gathering_tool, inventory: user.inventory) }

  describe 'actions' do
    it 'has no actions without equipment' do
      expect(user.actions).to eq([])
    end

    it 'combines actions from multiple pieces of equipment' do
      user.equip_item vehicle
      user.equip_item gathering_tool

      expect(user.actions).to eq(%w[gather travel])
    end
  end
end
