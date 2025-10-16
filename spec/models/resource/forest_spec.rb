require 'rails_helper'

RSpec.describe Resource::Forest do
  it 'gathers forest' do
    expect(create(:forest).gather.name.include?('Wood')).to be true
  end
end
