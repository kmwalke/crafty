require 'rails_helper'

RSpec.describe 'Gathering' do
  let!(:player) { login }
  let!(:location) { create(:location) }

  before do
    visit game_path
  end

  it 'displays the location\'s resources' do
  end
end
