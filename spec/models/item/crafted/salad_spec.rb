require 'rails_helper'

RSpec.describe Item::Crafted::Salad do
  let(:user) { create(:user) }
  let(:salad) { create(:crafted_salad, parent_inventory: user.inventory) }

  it 'uses' do
    user.update(energy: 0)
    energy = salad.energy
    salad.use

    expect(user.energy).to eq(energy)
  end

  it 'uses in a stack' do
    salad.update(stack_amount: 3)
    salad.use

    expect(salad.reload.stack_amount).to eq(2)
  end

  it 'gets the recipe' do
    expect(salad.recipe[ItemType::GATHERABLE[:fruit]]).to eq(3)
  end

  it 'gets the energy' do
    expect(salad.energy).to eq(Item::Crafted::Salad::ENERGY * salad.level)
  end
end
