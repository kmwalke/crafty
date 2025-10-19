require 'rails_helper'

RSpec.describe Item::Craftable::Tool::GatheringTool do
  let(:user) { create(:user) }
  let(:gathering_tool) { create(:craftable_tool_gathering_tool, inventory: user.inventory) }
  let(:resource) { create(:resource) }

  it 'doesn\'t update if user has low energy' do
    user.update(energy: 0)

    expect { gathering_tool.reload.gather(resource) }.to raise_error(CraftyError)
  end
end
