class Room < ApplicationRecord
  belongs_to :dungeon

  has_many :checks

  def run(player)
    player.update(vitality: player.vitality - 20)

    {
      room: self,
      result: 'Took 20 damage.'
    }
  end
end
