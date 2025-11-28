class Dungeon < ApplicationRecord
  before_save :update_level

  private

  def update_level
    raise CraftyError, 'average all of the room levels together and save'
  end
end
