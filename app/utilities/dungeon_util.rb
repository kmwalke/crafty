class DungeonUtil
  attr_accessor :dungeon

  def self.provision
    dungeon_data.each do |dungeon|
      DungeonUtil.new.provision_dungeon(dungeon)
    end
    User.first.update(location_id: 2)
  end

  def provision_dungeon(dungeon_data)
    @dungeon = Dungeon.find_or_create_by(name: dungeon_data[:name])
    @dungeon.update dungeon_data
    @dungeon.save
    create_rooms(DungeonUtil.room_data.select { |d| d[:dungeon_id] == @dungeon.id})
  end

  def create_rooms(room_data)
    room_data.each do |room_params|
      @dungeon.rooms << Room.build(room_params)
    end
  end

  def self.dungeon_data
    [
      # 1
      {
        name: 'Angry Sheep',
        location_id: 2
      },
      # 2
      {
        name: 'Odd Tree',
        location_id: 2
      },
      # 3
      {
        name: 'Crystal Quarry',
        location_id: 3
      },
      # 4
      {
        name: 'Active Cactus',
        location_id: 3
      },
      # 5
      {
        name: 'Criminal Band',
        location_id: 4
      },
      # 6
      {
        name: 'Old Mining Station',
        location_id: 5
      },
      # 7
      {
        name: 'Lava Chasm',
        location_id: 5
      },
      # 8
      {
        name: 'Old Research Station',
        location_id: 5
      },
      # 9
      {
        name: 'Scary Machine',
        location_id: 5
      },
    ]
  end

  def self.room_data
    [
      { name: 'Approach', dungeon_id: 1, level: Level::COMMON },
      { name: 'Fight', dungeon_id: 1, level: Level::COMMON },

      { name: 'Gather', dungeon_id: 2, level: Level::UNCOMMON },

      { name: 'Descent', dungeon_id: 3, level: Level::UNCOMMON },
      { name: 'Examine', dungeon_id: 3, level: Level::UNCOMMON },
      { name: 'Fight', dungeon_id: 3, level: Level::UNCOMMON },
      { name: 'Gather', dungeon_id: 3, level: Level::RARE },

      { name: 'Fight', dungeon_id: 4, level: Level::RARE },

      { name: 'Approach', dungeon_id: 5, level: Level::RARE },
      { name: 'Converse', dungeon_id: 5, level: Level::RARE },
      { name: 'Fight / Persuade', dungeon_id: 5, level: Level::RARE },

    ]
  end
end
