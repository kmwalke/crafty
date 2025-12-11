class Dungeon < ApplicationRecord
  belongs_to :location

  has_many :quests
  has_many :rooms, after_add: :calculate_level

  def run(player)
    rooms.map do |room|
      room.run(player)
    end
  end

  private

  def calculate_level(_room)
    self.level = rooms.pluck(:level).reduce(:+) / rooms.count
    save
  end
end
