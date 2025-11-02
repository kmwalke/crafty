require 'rails_helper'

RSpec.describe 'Item::Craftable::Tool' do
  let!(:player) { login }
  let!(:tool) { create(:gathering_tool, inventory: player.inventory) }

  before do
    visit game_path
    click_link tool.name
    click_link 'Equip'
  end

  it 'equips the tool' do
    expect(player.reload.tool.id).to eq(tool.id)
  end

  it 'displays equipped tool' do
    expect(page).to have_content("Tool: #{tool.name}")
  end

  it 'unequips a tool' do
    find_by_id('unequip_tool').click

    expect(player.reload.tool).to be_nil
  end
end
