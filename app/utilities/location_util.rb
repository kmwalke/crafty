class LocationUtil
  def self.provision_locations
    location_data.each do |info|
      LocationUtil.new.provision_location(name: info[:name], pos_x: info[:pos_x], pos_y: info[:pos_y],
                                          description: info[:description], bg_color: info[:bg_color])
    end
  end

  def provision_location(name: nil, pos_x: nil, pos_y: nil, description: nil, bg_color: nil)
    @location = Location.find_or_create_by(name:, pos_x:, pos_y:, description:, bg_color:)
    create_resources
  end

  def create_resources
    LocationUtil.resource_data.each do |datum|
      if datum[:location] == @location.name
        Resource.create(type: datum[:type], name: datum[:name], location: @location, level: datum[:level])
      end
    end
  end

  def self.resource_data
    [
      { type: ResourceType::TYPES[:crystal], name: 'Singing Crystal Mound', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:fish], name: 'Babbling Brook', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:forest], name: 'Sun Dappled Woods', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:fruit], name: 'Blackberry Bush', location: location_data[1][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:herd], name: 'Grazing Sheep', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:meadow], name: 'Blooming Field', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:ore], name: 'Copper Vein', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:ore], name: 'Iron Vein', location: location_data[1][:name], level: Level::COMMON },

      { type: ResourceType::TYPES[:crystal], name: 'Cracked Quartz Mound', location: location_data[2][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:herd], name: 'Skittering Lizards', location: location_data[2][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:meadow], name: 'Sparse Cacti', location: location_data[2][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:ore], name: 'Copper Vein', location: location_data[2][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:ore], name: 'Iron Vein', location: location_data[2][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:ore], name: 'Titanium Vein', location: location_data[2][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:ore], name: 'Aluminum Vein', location: location_data[2][:name], level: Level::COMMON },

      { type: ResourceType::TYPES[:crystal], name: 'Roselite Deposit', location: location_data[3][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:fish], name: 'Fetid Pool', location: location_data[3][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:forest], name: 'Twisted Trees', location: location_data[3][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:fruit], name: 'Poison Apples', location: location_data[3][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:herd], name: 'Mangy Wolves', location: location_data[3][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:meadow], name: 'Briar Patch', location: location_data[3][:name], level: Level::COMMON },

      { type: ResourceType::TYPES[:crystal], name: 'Obsidian', location: location_data[4][:name], level: Level::EPIC },
      { type: ResourceType::TYPES[:fruit], name: 'Habanero', location: location_data[4][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:herd], name: 'Lava Frog', location: location_data[4][:name], level: Level::EPIC },
      { type: ResourceType::TYPES[:meadow], name: 'Red Cactus', location: location_data[4][:name], level: Level::EPIC },
      { type: ResourceType::TYPES[:ore], name: 'Copper Vein', location: location_data[4][:name], level: Level::EPIC },
      { type: ResourceType::TYPES[:ore], name: 'Iron Vein', location: location_data[4][:name], level: Level::EPIC },
      { type: ResourceType::TYPES[:ore], name: 'Titanium Vein', location: location_data[4][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:ore], name: 'Aluminum Vein', location: location_data[4][:name], level: Level::RARE },

      { type: ResourceType::TYPES[:crystal], name: 'Singing Crystal Mound', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:crystal], name: 'Human-like Bone', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:fish], name: 'Rotting Creek', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:fruit], name: 'Large Mushroom', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:herd], name: 'Roaming Zombie', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:ore], name: 'Copper Vein', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:ore], name: 'Iron Vein', location: location_data[5][:name], level: Level::LEGENDARY }
    ]
  end

  def self.location_data
    [
      {
        name: 'Starting City',
        pos_x: 0,
        pos_y: 0,
        description: 'A small metropolis ruled over by Mayor Parker.',
        bg_color: '#cce6ff'
      },
      {
        name: 'Rolling Hills',
        pos_x: 10,
        pos_y: 21,
        description: 'Gentle hills.  Known for beginner ores and flowers.',
        bg_color: '#8cd98c'
      },
      {
        name: 'Harsh Desert',
        pos_x: 20,
        pos_y: 78,
        description: 'Sun blasted plains.  Odd Cacti grow occasionally.',
        bg_color: '#ffe699'
      },
      {
        name: 'Dark Forest',
        pos_x: -32,
        pos_y: -62,
        description: 'Spooky. Sounds of creatures just out of sight.',
        bg_color: '#003300'
      },
      {
        name: 'Flowing Volcano',
        pos_x: 89,
        pos_y: -62,
        description: 'Tall and steep. It is hard to breathe through the noxious air',
        bg_color: '#cc0000'
      },
      {
        name: 'Necromancer\'s Killing Field',
        pos_x: -93,
        pos_y: 87,
        description: 'There are bones everywhere.',
        bg_color: '#000000'
      }
    ]
  end
end
