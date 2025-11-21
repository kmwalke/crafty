require 'rails_helper'

RSpec.describe 'Gameplay' do
  pending 'Family tree for crafted items.'
  # see all the created_by details for the ingredients of a large item
  pending 'version__ui_update make game items clickable in the viewport'
  pending 'version__ui_update pixel graphics'
  pending 'version__ui_update desktop interface'
  #         Loom/Fate of Atlantis/Full Throttle style interface

  pending 'version_0.4 add many more locations'
  pending 'version_0.4 add many more recipes'
  pending 'version_0.4 user quests'
  # sales listings in reverse - I will pay 1000 credits for 5x Epic Lava Frog Mounts
  pending 'version_0.4 world quests'
  # pending 'what is the narrative?  Devs create a big quest,
  #          like "deliver 1 million pounds of food to the war refugees".
  #          This spawns a ton of player action, farmers, shippers, pirates, etc..'
  #           perhaps world events can help you level in skills you don't have
  #

  pending 'version_0.5 Add in skill progression and trades'
  # pending 'Junker Skill could let you break down items.  Opposite of crafting'

  pending 'version_0.6 async gameplay. Actions take real world time to accomplish'
  # Traveling , what does the screen look like while traveling?
  #        Location you are traveling to would be small, getting bigger in your view
  #        as you approach the location.
  #        Map can show your progress.  Solar system map, too.  Real-ish Holman Transfers.

  pending 'version_0.7 character aging'
  # pending 'concept of aging. You are a master craftsman, but your skills are decreasing due to age'
  pending 'version_0.7 push notifications to players'
  pending 'version_0.7 in game notifications/mail from players'

  pending 'version_0.8 typed bags, can only hold certain items, but much larger'
  pending 'version_0.8 new game + after your character dies'
  # pending 'if you max out your skill, perhaps the progeny gets to specialize in that skill plus another'\
  #           ' or perhaps they just get a permanent boost to that skill.  Static, but in addition to their skill' \
  #           'In this case, skills would be assigned at birth'
  #           'permanent stat boost in progeny characters.
  #           Perhaps they get 1/10 of your skill. Plus a bonus thing for if you maxed out'
  # You should be able to see your family tree

  pending 'version_0.8 dangers in the world. Pirates while traveling'
  # pending 'after winning, start new game+ with your child character'

  pending 'version_0.9 performance refactor'
  #         Entire page needs to use turbo frames and streams
  #         Entire backend needs cleanup.  Memory usage and DB calls
  # notice popups are lost when created in turbo frames
  #         https://hivekind.com/blog/exploring-flash-messages-with-turbo-streams-in-rails-7
  pending 'version_0.9 balance locations'
  pending 'version_0.9 balance crafting'
  pending 'version_1.0 ios/android app and desktop wrapper'

  pending 'What is Endgame? Perhaps maxing out all skills?'
  pending 'crafting in this game is the act of combining things'
  # not only to make another thing, but maybe to create an action.
  #   Equip 2 tools to get access to an action neither provides on their own
  #  "combining things to come up with novel approaches to situations"
  pending 'replace "bag" with pet'
  # pets have inventory, they work just like a bag, but cute

  pending 'use "favor" instead of credits'
  # works pretty much the same, but guild-specific
  # spend favor at the guild for things

  pending 'quest rewards'
  # do a quest for a blacksmith, instead of earning X credits, you earn a selection:
  # choose 1 of 3 rewards that the blacksmith could have crafted, based on their skills

  pending 'temporary items allow you to specialize in other skills for the day'
  # insert a skill shard into your matrix hole, then you get access to that skill tree until you replace it

  pending 'replace tools with "staffs"'
  # a staff can have many actions
  # instead of gathering tool only having gather and junking tool only having junk
  #   a staff might have gathering, fighting, and junking.  Maybe it is random?
  #   Skilled staff maker can choose the actions

  pending 'quest ideas'
  # multiplayer quest / dungeon run
  #   quest poster needs to fly ship to a dangerous place to get an item
  #   So must hire a cook, negotiator, and a fighter for the crew
  #   Combined skills of the crew contribute to success chance
  #   ALl the challenge / fun is in the planning
  #   The dungeon run itself is like automated rainbow 6 or xcom
  #   You put together the team and click go
  #   The dungeon is a series of rooms.  each room is a check of some sort
  #   the game automates you going through the rooms/checks
  # MOST BASIC VERSION:
  #   a 5 room dungeon where each room removes 25 hp and you move on
  #   You couldn't solo it, you would run out of health on room 4
  #   But 2 people share the damage, they could finish it
  #     This is a toy example.  a real dungeon would have various skill checks in each room.  perhaps randomized
  # Perhaps skill requirements: need a driver, crafter, and electrician
  # Or a combined level requirement, need 10 total levels, so a level 8 and 2 level ones or some other combo
  # rewards are proportional

  # Also need solo quests, though
  #   NPC generated, but also player generated quests
  #   ALL solo quests are part of a larger "world quest"

  # quests combine into larger quests
  # example:
  # Quest is "build a village"
  # that breaks into sub quests like "build a fence", "elect a mayor", "kill the dire boars"
  # Each of those breaks into sub quests: must collect items to be able to kill the boars
  # A player can contribute all or a little to each quest
  #   - contribute health potions or a sword to the kill boars quest
  #   - go kill 1 or 2 of the boars
  #   - collect wood for the fence
  # partial rewards based on how much you contributed
end
