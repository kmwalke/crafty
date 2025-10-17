class ItemUtil
  def self.provision_items
    location_data.each do |info|
      LocationUtil.new.provision_location(name: info[:name], pos_x: info[:pos_x], pos_y: info[:pos_y],
                                          description: info[:description], bg_color: info[:bg_color])
    end
  end

  def provision_item(name: nil, pos_x: nil, pos_y: nil, description: nil, bg_color: nil)
    @location = Location.find_or_create_by(name:, pos_x:, pos_y:, description:, bg_color:)
    create_resources
  end

  def self.building_data
    [
      Item::Craftable::Building.new(
        name: 'Traders Guild Hall',
        description: 'Gathering place for traders. Contains sales listings.',
        level: Level::COMMON,
        created_by: User.first,
        color: '#663300'
      )
    ]
  end
end
