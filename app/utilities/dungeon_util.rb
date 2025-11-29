class DungeonUtil
  attr_accessor :dungeon

  def self.provision
    dungeon_data.each do |dungeon|
      DungeonUtil.new.provision_dungeon(dungeon)
    end
  end

  def provision_dungeon(dungeon_data)
    @dungeon = Dungeon.find_or_create_by(name: dungeon_data[:name])
    @dungeon.update dungeon_data
    @dungeon.save
    create_rooms
  end

  def create_rooms
    DungeonUtil.room_data.each do |room_params|
      Room.find_or_create_by(room_params)
    end
  end

  def self.dungeon_data
    [
      {
        name: 'Angry Sheep',
        location_id: 2
      },
      {
        name: 'Odd Tree',
        location_id: 2
      },
      {
        name: 'Crystal Quarry',
        location_id: 3
      },
      {
        name: 'Active Cactus',
        location_id: 3
      },
      {
        name: 'Criminal Band',
        location_id: 4
      },
      {
        name: 'Old Mining Station',
        location_id: 5
      },
      {
        name: 'Lava Chasm',
        location_id: 5
      },
      {
        name: 'Old Research Station',
        location_id: 5
      },
      {
        name: 'Scary Machine',
        location_id: 5
      },
    ]
  end

  def self.room_data
    [
      { name: '', dungeon_id: 1, level: Level::COMMON },
    ]
  end
end
