require 'rails_helper'

RSpec.describe Resource::Fish do
  it 'gathers fish' do
    expect(create(:fish).gather.name).to eq('Fish')
  end
end
