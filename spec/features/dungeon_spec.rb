require 'rails_helper'

RSpec.describe 'Quests' do
  let!(:player) { create(:user) }
  let!(:dungeon) { create(:dungeon, :with_rooms, location: player.location) }

  before do
    login_as player
    visit game_path
  end

  describe 'shows a dungeon' do
    it 'name' do
      within 'div.actions' do
        expect(page).to have_content(dungeon.name)
      end
    end

    describe 'details' do
      before do
        within 'div.actions' do
          click_link dungeon.name
        end
      end

      it 'level' do
        within "#dungeon-#{dungeon.id}-popup" do
          expect(page).to have_content("#{Level.level_name dungeon.level}")
        end
      end

      it 'rooms' do
        within "#dungeon-#{dungeon.id}-popup" do
          expect(page).to have_content("#{dungeon.rooms.count} Rooms")
        end
      end
    end
  end

  describe 'delves a solo dungeon' do
    # When you click go on a dungeon, the entire thing is simulated out, 1 room at a time, 1 skill check at a time

    # v1: just subtract x hp per room
    # v2: skill checks are completely inventory based
    #   Look at the level of equipped items to pass skill check
    #   Look at / use up potions in inventory
    # v3: use skill levels, too

    before do
      within 'div.actions' do
        click_link dungeon.name
        click_link 'Start'
      end
    end

    it 'subtracts health' do
      expect(player.reload.vitality).to be < User::MAX_VITALITY
    end

    it 'shows the results' do
      dungeon.rooms.each do |room|
        expect(page).to have_content("#{room.name} Result:")
      end
    end
  end

  describe 'delves a group dungeon' do
    # Leader lists a quest in a building/town (quest board?)
    # assemble a group
    # Group members can chat with each other
    # Leader has to travel to quest location to start the quest
  end
end
