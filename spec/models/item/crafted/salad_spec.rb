require 'rails_helper'

RSpec.describe Item::Crafted::Salad do
  let(:user) { create(:user) }
  let(:salad) { create(:crafted_salad, parent_inventory: user.inventory) }

  it 'crafts' do
    crafting_tool = create(:crafting_tool, parent_inventory: user.inventory)
    user.equip_item(crafting_tool)
    new_item      = crafting_tool.craft(
      described_class,
      [
        create(:gatherable_fruit, stack_amount: 3, parent_inventory: user.inventory)
      ]
    )

    expect(new_item.id).not_to be_nil
  end

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
