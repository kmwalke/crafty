require 'rails_helper'

RSpec.describe Resource::Herd do
  it 'gathers herd' do
    expect(create(:herd).gather).to be_a(Item::Gatherable::Companion)
  end
end
