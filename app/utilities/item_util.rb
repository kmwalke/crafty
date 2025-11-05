class ItemUtil
  def self.provision_items
    building_data.each do |building|
      Location.first.add_building(building)
    end

    welcome_center = Item::Craftable::Building.first
    welcome_center_inventory.each do |item|
      Listing.create(
        building: welcome_center,
        item: item,
        created_by: User.first,
        price: 10
      )
    end
  end

  def self.building_data
    [
      Item::Craftable::Building.new(
        name: 'New Player Welcome Center',
        is_private: true,
        description: 'Gathering place for new players. Contains sales listings.',
        level: Level::COMMON,
        created_by: User.first,
        color: '#000099'
      ),
      Item::Craftable::Building.new(
        name: 'Traders Guild Hall',
        description: 'Gathering place for traders. Contains sales listings.',
        level: Level::UNCOMMON,
        created_by: User.first,
        color: '#663300'
      ),
      Item::Craftable::Building.new(
        name: 'Sea Turtle Skates',
        is_private: true,
        description: 'A good o\' skate shop.',
        level: Level::EPIC,
        created_by: User.find_by(name: 'Cris'),
        color: '#438D80'
      ),
      Item::Craftable::Building.new(
        name: 'Keith\'s Boat Shop.',
        is_private: true,
        description: 'Vehicle Store.  Sells more than just boats!',
        level: Level::RARE,
        created_by: User.find_by(name: 'Keith'),
        color: '#663300'
      ),
      Item::Craftable::Building.new(
        name: 'Spawnville Zoo',
        is_private: true,
        description: 'Kerry\'s first request.',
        level: Level::RARE,
        created_by: User.find_by(name: 'Kerry'),
        color: '#663300'
      )
    ]
  end

  def self.welcome_center_inventory
    [
      Item::Craftable::Vehicle.new(
        description: 'An old bike with a rusty trailer.',
        name: 'Bicycle',
        level: Level::COMMON,
        color: '#ffcccc',
        created_by: User.first
      ),
      Item::Craftable::Tool::GatheringTool.new(
        name: 'Universal Extractor',
        description: 'Magical seeming tech.  Can gather from any resource.',
        level: Level::LEGENDARY,
        color: 'gold',
        created_by: User.first
      ),
      Item::Craftable::Tool::CraftingTool.new(
        name: 'Universal Assembler',
        description: 'Magical seeming tech.  Can craft any item.',
        level: Level::LEGENDARY,
        color: 'gold',
        created_by: User.first
      )
    ]
  end
end
