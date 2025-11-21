require 'rails_helper'

RSpec.describe Item::Crafted::Tool::GatheringTool do
  let(:user) { create(:user) }
  let(:gathering_tool) { create(:gathering_tool, parent_inventory: user.child_inventory) }
  let(:resource) { create(:crystal) }

  before do
    user.equip_item(gathering_tool)
  end

  pending 'version_0.5 crafting/gathering tool levels'
  # common gathering tool can totally gather from legendary resources
  #   But you are getting 1/10000 legendary, 1/1000 epic, 1/100 rare, etc...
  # Legendary gathering tool get chances biased towards better level, but not guaranteed
  #   Like a shifting bell curve

  it 'lists actions' do
    expect(gathering_tool.actions).to eq(%w[gather])
  end

  it 'doesn\'t update if user has low energy' do
    user.update(energy: 0)

    expect { gathering_tool.gather(resource) }.to raise_error(CraftyError)
  end

  it 'gathers' do
    item_count = user.child_inventory.items.count
    gathering_tool.gather(resource)
    expect(user.child_inventory.items.count == item_count + 1).to be true
  end
end
