class LocationUtil
  attr_accessor :location

  def self.provision_locations
    location_data.each do |info|
      LocationUtil.new.provision_location(name: info[:name], pos_x: info[:pos_x], pos_y: info[:pos_y],
                                          description: info[:description], bg_color: info[:bg_color],
                                          highlight_color: info[:highlight_color])
    end
  end

  def provision_location(name: nil, pos_x: nil, pos_y: nil, description: nil, bg_color: nil, highlight_color: nil)
    @location = Location.find_or_create_by(name:, pos_x:, pos_y:, description:, bg_color:, highlight_color:)
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
      { type: ResourceType::TYPES[:crystal], name: 'Singing', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:fish], name: 'Babbling Brook', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:forest], name: 'Sun Dappled', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:bush], name: 'Blackberry', location: location_data[1][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:herd], name: 'Grazing Sheep', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:meadow], name: 'Blooming', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:ore], name: 'Copper', location: location_data[1][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:ore], name: 'Iron', location: location_data[1][:name], level: Level::COMMON },

      { type: ResourceType::TYPES[:crystal], name: 'Cracked Quartz', location: location_data[2][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:herd], name: 'Skittering Lizard', location: location_data[2][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:meadow], name: 'Sparse Cacti', location: location_data[2][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:ore], name: 'Copper', location: location_data[2][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:ore], name: 'Iron', location: location_data[2][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:ore], name: 'Titanium', location: location_data[2][:name], level: Level::COMMON },
      { type: ResourceType::TYPES[:ore], name: 'Aluminum', location: location_data[2][:name], level: Level::COMMON },

      { type: ResourceType::TYPES[:crystal], name: 'Roselite', location: location_data[3][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:fish], name: 'Fetid Pool', location: location_data[3][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:forest], name: 'Twisted', location: location_data[3][:name], level: Level::UNCOMMON },
      { type: ResourceType::TYPES[:bush], name: 'Poison Apple', location: location_data[3][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:herd], name: 'Mangy Wolf', location: location_data[3][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:meadow], name: 'Briar Patch', location: location_data[3][:name], level: Level::COMMON },

      { type: ResourceType::TYPES[:crystal], name: 'Obsidian', location: location_data[4][:name], level: Level::EPIC },
      { type: ResourceType::TYPES[:bush], name: 'Habanero', location: location_data[4][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:herd], name: 'Lava Frog', location: location_data[4][:name], level: Level::EPIC },
      { type: ResourceType::TYPES[:meadow], name: 'Red Cactus', location: location_data[4][:name], level: Level::EPIC },
      { type: ResourceType::TYPES[:ore], name: 'Copper', location: location_data[4][:name], level: Level::EPIC },
      { type: ResourceType::TYPES[:ore], name: 'Iron', location: location_data[4][:name], level: Level::EPIC },
      { type: ResourceType::TYPES[:ore], name: 'Titanium', location: location_data[4][:name], level: Level::RARE },
      { type: ResourceType::TYPES[:ore], name: 'Aluminum', location: location_data[4][:name], level: Level::RARE },

      { type: ResourceType::TYPES[:crystal], name: 'Singing', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:crystal], name: 'Human-like Bone', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:fish], name: 'Rotting Creek', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:bush], name: 'Large Mushroom', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:herd], name: 'Roaming Zombie', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:ore], name: 'Copper', location: location_data[5][:name], level: Level::LEGENDARY },
      { type: ResourceType::TYPES[:ore], name: 'Iron', location: location_data[5][:name], level: Level::LEGENDARY }
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
        bg_color: '#003300',
        highlight_color: 'white'
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
        bg_color: '#000000',
        highlight_color: 'white'
      }
    ]
  end
end
