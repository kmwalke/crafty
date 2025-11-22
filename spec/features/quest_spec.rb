require 'rails_helper'

RSpec.describe 'Quests' do
  describe 'quest board' do
    # quest boards are in towns
    # They list all the quests in an area (user and system generated)
    # Dungeon quests involve an encounter, may be fighting or diplomacy or fetching or something else
    # crafting quests are reverse sales listings
    # Each type of quest should challenge a specific skill/job/set of skills
  end

  describe 'dungeon quests' do
    describe 'shows a dungeon in a location' do
      # A dungeon contains 1 or many rooms
      # A room has 1 or many skill checks

    end

    describe 'delves a solo dungeon' do
      # player lists a quest in a building/town (quest board?)
      # player travels to quest location to start the dungeon
      # When you click go on a dungeon, the entire thing is simulated out, 1 room at a time, 1 skill check at a time
      #
      # For now, skill checks are completely inventory based
      #   Look at the level of equipped items to pass skill check
      #   Look at / use up potions in inventory
      # Later, it will use skill levels, too
      #

    end

    describe 'delves a group dungeon' do
      # Leader lists a quest in a building/town (quest board?)
      # assemble a group
      # Group members can chat with each other
      # Leader has to travel to quest location to start the quest
    end
  end

  describe 'fetch quests' do
    # tests your traveling skill
    # Go pickup the cargo from location x and deliver to location y
    # Space trucker quest
    # May be dangers/challenges along the way
  end

  describe 'gathering quests' do
    # gather items and sell it to the lister
    # Delve into a dungeon with rare crystals in the back
    # Travel to a far off provence to beg/borrow/steal rare items
    # Indiana Jones is the Experience comp
  end

  describe 'crafting quests' do
    # craft an item and sell it to the lister
    # Travel to the dwarf kingdom to use the fabled Mithril Forge # There you craft the best sword ever made
    # Study under a master biologist to craft the finest bio-engineered pet
  end
end