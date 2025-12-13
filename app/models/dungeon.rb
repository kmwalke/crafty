class Dungeon < ApplicationRecord
  belongs_to :location

  has_many :quests
  has_many :rooms, after_add: :calculate_level

  attr_reader :results, :player

  def run(player)
    init(player)
    run_rooms
    gather_reward
    @results
  end

  private

  def init(player)
    @player  = player
    @results = {
      rooms: {}
    }
  end

  def run_rooms
    rooms.each do |room|
      @results[:rooms][room.name] = room.run(@player)
    end
  end

  def gather_reward
    @results[:reward] = 'You won a nice crafting ingredient.'
  end

  def calculate_level(_room)
    self.level = rooms.pluck(:level).reduce(:+) / rooms.count
    save
  end
end
