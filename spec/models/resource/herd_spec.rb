require 'rails_helper'

RSpec.describe Resource::Herd do
  it 'gathers herd' do
    expect(create(:herd).gather.name.include?('Pelt')).to be true
  end
end
