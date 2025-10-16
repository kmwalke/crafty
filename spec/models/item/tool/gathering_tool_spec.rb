require 'rails_helper'

RSpec.describe Item::Tool::GatheringTool do
  it 'sets the type' do
    expect(create(:gathering_tool).type).to eq('Item::Tool')
  end
end
