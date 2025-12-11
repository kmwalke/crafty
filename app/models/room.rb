class Room < ApplicationRecord
  belongs_to :dungeon

  def run(player)
    player.update(vitality: player.vitality - 20)
  end
end
