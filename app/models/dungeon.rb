class Dungeon < ApplicationRecord
  belongs_to :location

  has_many :rooms, after_add: :calculate_level

  private

  def calculate_level(_room)
    self.level = rooms.pluck(:level).reduce(:+) / rooms.count
  end
end
