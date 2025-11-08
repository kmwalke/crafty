require 'rails_helper'

RSpec.describe Item::Craftable::Tool::GatheringTool do
  let(:user) { create(:user) }
  let(:gathering_tool) { create(:gathering_tool, parent_inventory: user.inventory) }
  let(:resource) { create(:crystal) }

  before do
    user.equip_item(gathering_tool)
  end

  it 'lists actions' do
    expect(gathering_tool.actions).to eq(%w[gather])
  end

  it 'doesn\'t update if user has low energy' do
    user.update(energy: 0)

    expect { gathering_tool.gather(resource) }.to raise_error(CraftyError)
  end

  it 'gathers' do
    item_count = user.inventory.items.count
    gathering_tool.gather(resource)
    expect(user.inventory.items.count == item_count + 1).to be true
  end
end
