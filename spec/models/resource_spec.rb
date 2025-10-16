require 'rails_helper'

RSpec.describe Resource do
  let!(:resource) { create(:resource) }

  it 'doesnt gather from a generic resource' do
    expect { resource.gather }.to raise_error(CraftyError)
  end
end
