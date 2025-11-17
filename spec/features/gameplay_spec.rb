require 'rails_helper'

RSpec.describe 'Gameplay' do
  pending 'BUG: crafting screws a second time makes 101 screws, not 200'
  pending 'Family tree for crafted items.'
  # see all the created_by details for the ingredients of a large item
  pending 'back button on browser should reload game_path'
  pending 'ItemType could be deleted if some automated listing exists'
  # something like Item.subclasses / Item::Crafted.subclasses / Item::Crafted.subclasses[:leather]
  # then the whole thing could be automated.  Including putting the types into the DB for FKs
  # must be just as performant as current solution
  pending 'version_0.4 add many more locations'
  pending 'version_0.4 add many more recipes'
  pending 'version_0.4 user quests'
  # sales listings in reverse - I will pay 1000 credits for 5x Epic Lava Frog Mounts
  pending 'version_0.4 world quests'
  pending 'version_0.9 balance locations'
  pending 'version_0.9 balance crafting'
  pending 'version__ui_update make game items clickable in the viewport'
  pending 'version__ui_update organize partial views'
  pending 'version__ui_update pixel graphics'
  pending 'version__ui_update desktop interface'
  #         Loom/Fate of Atlantis/Full Throttle style interface
  pending 'version_0.9 performance refactor'
  #         Entire page needs to use turbo frames and streams
  #         Entire backend needs cleanup.  Memory usage and DB calls
  # notice popups are lost when created in turbo frames
  #         https://hivekind.com/blog/exploring-flash-messages-with-turbo-streams-in-rails-7
  pending 'version_0.5 Add in skill progression and trades'
  pending 'version_0.6 async gameplay. Actions take real world time to accomplish'
  pending 'version_0.7 character aging'
  pending 'version_0.8 dangers in the world. Pirates while traveling'
  pending 'version_0.8 new game + after your character dies'
  pending 'version_0.7 in game notifications/mail from players'
  pending 'version_0.7 push notifications to players'
  pending 'version_1.0 ios/android app and desktop wrapper'
  # pending 'What is Endgame? Perhaps maxing out all skills?'
  # pending 'after winning, start new game+ with your child character'
  # pending 'what is the narrative?  Devs create a big quest,
  #          like "deliver 1 million pounds of food to the war refugees".
  #          This spawns a ton of player action, farmers, shippers, pirates, etc..'
  #           perhaps world events can help you level in skills you don't have
  #
  # pending 'Junker Skill could let you break down items.  Opposite of crafting'
  # pending 'concept of aging. You are a master craftsman, but your skills are decreasing due to age'
  # pending 'if you max out your skill, perhaps the progeny gets to specialize in that skill plus another'\
  #           ' or perhaps they just get a permanent boost to that skill.  Static, but in addition to their skill' \
  #           'In this case, skills would be assigned at birth'
  #           'permanent stat boost in progeny characters.
  #           Perhaps they get 1/10 of your skill. Plus a bonus thing for if you maxed out'
  # You should be able to see your family tree

  # This is becoming a rougelike multiplayer point and click game

  # Traveling , what does the screen look like while traveling?
  #        Location you are traveling to would be small, getting bigger in your view
  #        as you approach the location.
  #        Map can show your progress.  Solar system map, too.  Real-ish Holman Transfers.
end
