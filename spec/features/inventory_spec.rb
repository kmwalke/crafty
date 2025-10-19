require 'rails_helper'

RSpec.describe 'Inventory' do
  let!(:player) { login }

  before do
    5.times.map { player.inventory.add_item(build(:generic_item, inventory: nil)) }
    player.inventory.add_item(
      build(
        :generic_item,
        inventory: nil,
        type: player.inventory.items.last.type,
        level: player.inventory.items.last.level
      )
    )
    visit game_path
  end

  it 'shows the inventory items' do
    player.inventory.items.each do |item|
      expect(page).to have_css('fieldset.inventory li span', text: item.name)
    end
  end

  it 'shows the inventory items stack amount' do
    expect(page).to have_css('fieldset.inventory li span.stack-amount', text: 2)
  end

  it 'shows remaining inventory space' do
    expect(page).to have_css('fieldset.inventory span.remaining-space', text: player.inventory.remaining_space)
  end

  describe 'details on click' do
    let(:item) { player.inventory.items.last }

    before do
      click_link item.name
    end

    it 'shows description' do
      expect(page).to have_css("div.popup#item-#{item.id}-details p", text: item.description)
    end

    it 'shows level' do
      expect(page).to have_css("div.popup#item-#{item.id}-details span", text: item.level_name)
    end

    it 'shows created by' do
      expect(page).to have_css("div.popup#item-#{item.id}-details span", text: item.created_by.name)
    end
  end
end
