class Quest < ApplicationRecord
  belongs_to :location
  belongs_to :dungeon
end
