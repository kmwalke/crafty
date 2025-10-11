require 'rails_helper'

RSpec.describe 'Inventory' do
  describe 'logged in' do
    before do
      login
      visit game_path
    end

    it 'opens the inventory' do
      expect(true).to be false
    end
  end
end
