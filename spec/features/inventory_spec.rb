require 'rails_helper'

RSpec.describe 'Inventory' do
  let!(:player) { login }

  before do
    5.times.map { player.add_item(build(:generic_item, parent_inventory: nil)) }
    player.add_item(
      build(
        :generic_item,
        parent_inventory: nil,
        type: player.child_inventory.items.last.type,
        name: player.child_inventory.items.last.name,
        level: player.child_inventory.items.last.level
      )
    )
    visit game_path
  end

  it 'shows the inventory items' do
    player.child_inventory.items.each do |item|
      expect(page).to have_css('div.inventory li span', text: item.name)
    end
  end

  it 'shows the inventory items stack amount' do
    expect(page).to have_css('div.inventory li span.stack-amount', text: 2)
  end

  it 'shows remaining inventory space' do
    expect(page).to have_css('div.inventory span.remaining-space', text: player.child_inventory.remaining_space)
  end

  describe 'details on click' do
    let(:item) { player.child_inventory.items.last }

    before do
      click_link item.full_name
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

    describe 'drops the item' do
      before do
        within "div.popup#item-#{item.id}-details" do
          click_link 'Drop Item'
        end
      end

      it 'delists' do
        within 'div.inventory' do
          expect(page).to have_no_content(item.full_name)
        end
      end
    end

    describe 'edible items' do
      let!(:salad) { create(:crafted_salad, parent_inventory: player.child_inventory) }

      before do
        player.update(energy: 0)
        visit game_path
        click_link salad.name
      end

      it 'shows the energy recovered by an item' do
        pending 'need different displays for each useable item'
        within "div.popup#item-#{salad.id}-details" do
          expect(page).to have_content(salad.energy)
        end
      end

      it 'recovers energy' do
        within "div.popup#item-#{salad.id}-details" do
          click_link 'Use'
        end

        expect(player.reload.energy).to be > 0
      end
    end
  end
end
