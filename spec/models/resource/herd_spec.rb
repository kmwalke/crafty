require 'rails_helper'

RSpec.describe Resource::Herd do
  it 'gathers herd' do
    expect(create(:herd).gather.name).to eq('Pelt')
  end
end
