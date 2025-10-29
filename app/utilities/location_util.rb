class LocationUtil
  attr_accessor :location

  def self.provision_locations
    location_data.each do |location|
      LocationUtil.new.provision_location(location)
    end
  end

  def provision_location(location)
    location.save
    @location = location
    create_resources
  end

  def create_resources
    LocationUtil.resource_data.each do |resource|
      resource.save if resource.location_id == @location.id
    end
  end

  def self.resource_data
    [
      Resource::Crystal.build(name: 'Singing', location_id: 2, level: Level::COMMON),
      Resource::Fish.build(name: 'Babbling Brook', location_id: 2, level: Level::COMMON),
      Resource::Forest.build(name: 'Sun Dappled', location_id: 2, level: Level::COMMON),
      Resource::Bush.build(name: 'Blackberry', location_id: 2, level: Level::UNCOMMON),
      Resource::Herd.build(name: 'Grazing Sheep', location_id: 2, level: Level::COMMON),
      Resource::Meadow.build(name: 'Blooming', location_id: 2, level: Level::COMMON),
      Resource::Ore.build(name: 'Copper', location_id: 2, level: Level::COMMON),
      Resource::Ore.build(name: 'Iron', location_id: 2, level: Level::COMMON),

      Resource::Crystal.build(name: 'Cracked Quartz', location_id: 3, level: Level::RARE),
      Resource::Herd.build(name: 'Skittering Lizard', location_id: 3, level: Level::UNCOMMON),
      Resource::Meadow.build(name: 'Sparse Cacti', location_id: 3, level: Level::UNCOMMON),
      Resource::Ore.build(name: 'Copper', location_id: 3, level: Level::UNCOMMON),
      Resource::Ore.build(name: 'Iron', location_id: 3, level: Level::UNCOMMON),
      Resource::Ore.build(name: 'Titanium', location_id: 3, level: Level::COMMON),
      Resource::Ore.build(name: 'Aluminum', location_id: 3, level: Level::COMMON),

      Resource::Crystal.build(name: 'Roselite', location_id: 4, level: Level::RARE),
      Resource::Fish.build(name: 'Fetid Pool', location_id: 4, level: Level::RARE),
      Resource::Forest.build(name: 'Twisted', location_id: 4, level: Level::UNCOMMON),
      Resource::Bush.build(name: 'Poison Apple', location_id: 4, level: Level::RARE),
      Resource::Herd.build(name: 'Mangy Wolf', location_id: 4, level: Level::RARE),
      Resource::Meadow.build(name: 'Briar Patch', location_id: 4, level: Level::COMMON),

      Resource::Crystal.build(name: 'Obsidian', location_id: 5, level: Level::EPIC),
      Resource::Bush.build(name: 'Habanero', location_id: 5, level: Level::RARE),
      Resource::Herd.build(name: 'Lava Frog', location_id: 5, level: Level::EPIC),
      Resource::Meadow.build(name: 'Red Cactus', location_id: 5, level: Level::EPIC),
      Resource::Ore.build(name: 'Copper', location_id: 5, level: Level::EPIC),
      Resource::Ore.build(name: 'Iron', location_id: 5, level: Level::EPIC),
      Resource::Ore.build(name: 'Titanium', location_id: 5, level: Level::RARE),
      Resource::Ore.build(name: 'Aluminum', location_id: 5, level: Level::RARE),

      Resource::Crystal.build(name: 'Singing', location_id: 6, level: Level::LEGENDARY),
      Resource::Crystal.build(name: 'Human-like Bone', location_id: 6, level: Level::LEGENDARY),
      Resource::Fish.build(name: 'Rotting Creek', location_id: 6, level: Level::LEGENDARY),
      Resource::Bush.build(name: 'Large Mushroom', location_id: 6, level: Level::LEGENDARY),
      Resource::Herd.build(name: 'Roaming Zombie', location_id: 6, level: Level::LEGENDARY),
      Resource::Ore.build(name: 'Copper', location_id: 6, level: Level::LEGENDARY),
      Resource::Ore.build(name: 'Iron', location_id: 6, level: Level::LEGENDARY)
    ]
  end

  def self.location_data
    [
      Location.build(
        name: 'Crystalgard',
        pos_x: 0,
        pos_y: 0,
        description: 'A small metropolis ruled over by Mayor Parker. Home of the glassmakere',
        bg_color: '#cce6ff'
      ),
      Location.build(
        name: 'The Fold',
        pos_x: 10,
        pos_y: 21,
        description: 'Gentle hills.  Known for beginner ores and flowers.',
        bg_color: '#8cd98c'
      ),
      Location.build(
        name: 'Harsh Desert',
        pos_x: 20,
        pos_y: 78,
        description: 'Sun blasted plains.  Odd Cacti grow occasionally.',
        bg_color: '#ffe699'
      ),
      Location.build(
        name: 'Dark Forest',
        pos_x: -32,
        pos_y: -62,
        description: 'Spooky. Sounds of creatures just out of sight.',
        bg_color: '#003300',
        highlight_color: 'white'
      ),
      Location.build(
        name: 'Flowing Volcano',
        pos_x: 89,
        pos_y: -62,
        description: 'Tall and steep. It is hard to breathe through the noxious air.',
        bg_color: '#cc0000'
      ),
      Location.build(
        name: 'Alien Ruins',
        pos_x: -93,
        pos_y: 87,
        description: 'There are bones everywhere.',
        bg_color: '#222222',
        highlight_color: 'white'
      )
    ]
  end
end
