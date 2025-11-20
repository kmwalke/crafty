require 'rails_helper'

RSpec.describe 'Bag' do
  let!(:player) { login }
  let!(:bag) { create(:crafted_bag, parent_inventory: player.inventory) }
  let!(:item) { create(:gatherable_fruit, parent_inventory: bag.child_inventory) }

  before do
    visit game_path
    click_link bag.name
    click_link 'Equip'
  end

  it 'equips the bag' do
    expect(player.reload.bag).to eq(bag)
  end

  it 'displays equipped bag' do
    expect(page).to have_content("Bag: #{bag.name}")
  end

  it 'unequips a bag' do
    find_by_id('unequip_bag').click

    expect(player.reload.bag).to be_nil
  end

  it 'shows the bag inventory' do
    within 'div.inventory' do
      expect(page).to have_content("#{bag.full_name} Inventory")
    end
  end

  it 'shows the items in bag inventory' do
    within 'div.bag-inventory' do
      expect(page).to have_content(item.full_name)
    end
  end
end
