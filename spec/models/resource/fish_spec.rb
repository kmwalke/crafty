require 'rails_helper'

RSpec.describe Resource::Fish do
  it 'gathers fish' do
    expect(create(:fish).gather).to be_a Item::Gatherable::Fish
  end
end
