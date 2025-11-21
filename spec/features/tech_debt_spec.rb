require 'rails_helper'

RSpec.describe 'Tech Debt' do
  pending 'change user to player'

  pending 'organize partial views AFTER UI'
  pending 'organize routes AFTER UI'
  pending 'organize ItemType constants'

  pending 'streamline API levels: routes/controller/model'
  pending 'document api levels'

  pending 'back button on browser should reload game_path'
  pending 'ItemType could be deleted if some automated listing exists'
  # something like Item.subclasses / Item::Crafted.subclasses / Item::Crafted.subclasses[:leather]
  # then the whole thing could be automated.  Including putting the types into the DB for FKs
  # must be just as performant as current solution
  # [2] pry(main)> Rails.application.eager_load!
  # => nil
  # [3] pry(main)> Item.descendants
end
