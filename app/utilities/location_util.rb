class LocationUtil
  def self.provision_locations
    location_data.each do |info|
      LocationUtil.new.provision_location(name: info[:name], pos_x: info[:pos_x], pos_y: info[:pos_y],
                                          description: info[:description])
    end
  end

  def provision_location(name: nil, pos_x: nil, pos_y: nil, description: nil)
    @location = Location.find_or_create_by(name:, pos_x:, pos_y:, description:)
    create_resources
  end

  def create_resources
    LocationUtil.resource_data.each do |datum|
      Resource.create(type: datum[:type], name: datum[:name], location: @location) if datum[:location] == @location.name
    end
  end

  def self.resource_data
    [
      { type: 'Crystal', name: 'Singing Crystal Mound', location: location_data[1][:name] }
    ]
  end

  def self.location_data
    [
      {
        name: 'Starting City',
        pos_x: 0,
        pos_y: 0,
        description: 'A small metropolis ruled over by Governor Parker.'
      },
      {
        name: 'Rolling Hills',
        pos_x: 10,
        pos_y: 57,
        description: 'Gentle hills.  Known for beginner ores and flowers.'
      },
      {
        name: 'Harsh Desert',
        pos_x: 20,
        pos_y: 78,
        description: 'Sun blasted plains.  Odd Cactuses grow occasionally.'
      },
      {
        name: 'Dark Forest',
        pos_x: 89,
        pos_y: -62,
        description: 'Spooky. Sounds of creatures just out of sight.'
      }
    ]
  end
end
