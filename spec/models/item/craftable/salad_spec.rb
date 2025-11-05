require 'rails_helper'

RSpec.describe Item::Craftable::Salad do
  let(:user) { create(:user) }
  let(:salad) { create(:craftable_salad, inventory: user.inventory) }

  it 'uses' do
    user.update(energy: 0)
    salad.use

    expect(user.energy).to eq(Item::Craftable::Salad::ENERGY)
  end
end
