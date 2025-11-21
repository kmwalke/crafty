require 'rails_helper'

RSpec.describe 'Pet' do
  let!(:player) { login }
  let!(:pet) { create(:crafted_pet, parent_inventory: player.child_inventory) }
  let!(:item) { create(:gatherable_fruit, parent_inventory: pet.child_inventory) }

  before do
    visit game_path
    click_link pet.name
    click_link 'Equip'
  end

  it 'equips the pet' do
    expect(player.reload.pet).to eq(pet)
  end

  it 'displays equipped pet' do
    expect(page).to have_content("Pet: #{pet.name}")
  end

  it 'unequips a pet' do
    find_by_id('unequip_pet').click

    expect(player.reload.pet).to be_nil
  end

  it 'shows the pet inventory' do
    within 'div.inventory' do
      expect(page).to have_content("#{pet.full_name} Inventory")
    end
  end

  it 'shows the items in pet inventory' do
    within 'div.pet-inventory' do
      expect(page).to have_content(item.full_name)
    end
  end
end
