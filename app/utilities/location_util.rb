class LocationUtil
  attr_accessor :location

  def self.provision_locations
    location_data.each do |location|
      LocationUtil.new.provision_location(location)
    end
  end

  def provision_location(location_data)
    @location = Location.find_or_create_by(name: location_data[:name])
    @location.update location_data
    @location.save
    create_resources
  end

  def create_resources
    LocationUtil.resource_data.each do |resource_params|
      Resource.find_or_create_by(resource_params)
    end
  end

  def self.resource_data
    [
      { type: 'Resource::Crystal', name: 'Singing', location_id: 2, level: Level::COMMON },
      { type: 'Resource::Fish', name: 'Babbling Brook', location_id: 2, level: Level::COMMON },
      { type: 'Resource::Forest', name: 'Sun Dappled', location_id: 2, level: Level::COMMON },
      { type: 'Resource::Bush', name: 'Blackberry', location_id: 2, level: Level::UNCOMMON },
      { type: 'Resource::Herd', name: 'Grazing Sheep', location_id: 2, level: Level::COMMON },
      { type: 'Resource::Meadow', name: 'Blooming', location_id: 2, level: Level::COMMON },
      { type: 'Resource::Ore', name: 'Copper', location_id: 2, level: Level::COMMON },
      { type: 'Resource::Ore', name: 'Iron', location_id: 2, level: Level::COMMON },

      { type: 'Resource::Crystal', name: 'Cracked Quartz', location_id: 3, level: Level::RARE },
      { type: 'Resource::Herd', name: 'Skittering Lizard', location_id: 3, level: Level::UNCOMMON },
      { type: 'Resource::Meadow', name: 'Sparse Cacti', location_id: 3, level: Level::UNCOMMON },
      { type: 'Resource::Ore', name: 'Copper', location_id: 3, level: Level::UNCOMMON },
      { type: 'Resource::Ore', name: 'Iron', location_id: 3, level: Level::UNCOMMON },
      { type: 'Resource::Ore', name: 'Titanium', location_id: 3, level: Level::COMMON },
      { type: 'Resource::Ore', name: 'Aluminum', location_id: 3, level: Level::COMMON },

      { type: 'Resource::Crystal', name: 'Roselite', location_id: 4, level: Level::RARE },
      { type: 'Resource::Fish', name: 'Fetid Pool', location_id: 4, level: Level::RARE },
      { type: 'Resource::Forest', name: 'Twisted', location_id: 4, level: Level::UNCOMMON },
      { type: 'Resource::Bush', name: 'Poison Apple', location_id: 4, level: Level::RARE },
      { type: 'Resource::Herd', name: 'Mangy Wolf', location_id: 4, level: Level::RARE },
      { type: 'Resource::Meadow', name: 'Briar Patch', location_id: 4, level: Level::COMMON },

      { type: 'Resource::Crystal', name: 'Obsidian', location_id: 5, level: Level::EPIC },
      { type: 'Resource::Bush', name: 'Habanero', location_id: 5, level: Level::RARE },
      { type: 'Resource::Herd', name: 'Lava Frog', location_id: 5, level: Level::EPIC },
      { type: 'Resource::Meadow', name: 'Red Cactus', location_id: 5, level: Level::EPIC },
      { type: 'Resource::Ore', name: 'Copper', location_id: 5, level: Level::EPIC },
      { type: 'Resource::Ore', name: 'Iron', location_id: 5, level: Level::EPIC },
      { type: 'Resource::Ore', name: 'Titanium', location_id: 5, level: Level::RARE },
      { type: 'Resource::Ore', name: 'Aluminum', location_id: 5, level: Level::RARE },

      { type: 'Resource::Crystal', name: 'Singing', location_id: 6, level: Level::LEGENDARY },
      { type: 'Resource::Crystal', name: 'Human-like Bone', location_id: 6, level: Level::LEGENDARY },
      { type: 'Resource::Fish', name: 'Rotting Creek', location_id: 6, level: Level::LEGENDARY },
      { type: 'Resource::Bush', name: 'Large Mushroom', location_id: 6, level: Level::LEGENDARY },
      { type: 'Resource::Herd', name: 'Roaming Zombie', location_id: 6, level: Level::LEGENDARY },
      { type: 'Resource::Ore', name: 'Copper', location_id: 6, level: Level::LEGENDARY },
      { type: 'Resource::Ore', name: 'Iron', location_id: 6, level: Level::LEGENDARY }
    ]
  end

  def self.location_data
    [
      {
        name: 'Crystalgard',
        pos_x: 0,
        pos_y: 0,
        description: 'A small metropolis ruled over by Mayor Parker. Home of the glassmakers.',
        bg_color: '#cce6ff'
      },
      {
        name: 'The Fold',
        pos_x: 10,
        pos_y: 21,
        description: 'Gentle hills.  Known for beginner ores and flowers.',
        bg_color: '#8cd98c'
      },
      {
        name: 'Harsh Desert',
        pos_x: -32,
        pos_y: 52,
        description: 'Sun blasted plains.  Odd Cacti grow occasionally.',
        bg_color: '#ffe699'
      },
      {
        name: 'Dark Forest',
        pos_x: 20,
        pos_y: 78,
        description: 'Spooky. Sounds of creatures just out of sight.',
        bg_color: '#003300',
        highlight_color: 'white'
      },
      {
        name: 'Flowing Volcano',
        pos_x: 89,
        pos_y: -122,
        description: 'Tall and steep. It is hard to breathe through the noxious air.',
        bg_color: '#cc0000'
      },
      {
        name: 'Alien Ruins',
        pos_x: -193,
        pos_y: 287,
        description: 'There are bones everywhere.',
        bg_color: '#222222',
        highlight_color: 'white'
      }
    ]
  end
end
