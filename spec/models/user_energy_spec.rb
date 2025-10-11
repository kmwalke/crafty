require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'energy' do
    pending 'recharge energy with items'
    pending 'recharge energy over time'
    pending 'recharge energy faster in certain locations (restful ones)'
  end
end
