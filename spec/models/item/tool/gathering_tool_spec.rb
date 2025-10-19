require 'rails_helper'

RSpec.describe Item::Craftable::Tool::GatheringTool do
  let(:user) { create(:user) }
  let(:gathering_tool) { create(:gathering_tool, inventory: user.inventory) }
  let(:resource) { create(:resource) }

  it 'sets the type' do
    expect(create(:gathering_tool).type).to eq('Item::Craftable::Tool')
  end

  it 'doesn\'t update if user has low energy' do
    user.update(energy: 0)

    expect { gathering_tool.reload.gather(resource) }.to raise_error(CraftyError)
  end
end
