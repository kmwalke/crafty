require 'rails_helper'

RSpec.describe 'Equipment' do
  describe 'logged in' do
    before do
      login
      visit game_path
    end

    it 'equips a vehicle' do
      expect(true).to be false
    end
  end
end
