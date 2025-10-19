require 'rails_helper'

RSpec.describe Item::Craftable::Tool do
  let(:tool) { create(:tool) }

  it 'lists actions' do
    expect(tool.actions).to eq(%w[gather])
  end
end
