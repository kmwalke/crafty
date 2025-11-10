class ItemUtil
  def self.provision_items
    building_data.each do |building_params|
      building = Item::Crafted::Building.find_or_create_by(building_params)
      Location.first.add_building(building) if building.parent_inventory.nil?
    end

    welcome_center = Item::Crafted::Building.first
    welcome_center_inventory.each do |item_params|
      item = Item.find_or_create_by(item_params)
      Listing.find_or_create_by(
        building: welcome_center,
        item: item,
        created_by: User.first,
        price: 10,
        infinite: true
      )
    end
  end

  def self.building_data
    [
      {
        name: 'New Player Welcome Center',
        is_private: true,
        description: 'Gathering place for new players. Contains sales listings.',
        level: Level::COMMON,
        created_by: User.first,
        color: '#000099'
      },
      {
        name: 'Traders Guild Hall',
        description: 'Gathering place for traders. Contains sales listings.',
        level: Level::UNCOMMON,
        created_by: User.first,
        color: '#663300'
      },
      {
        name: 'Sea Turtle Skates',
        is_private: true,
        description: 'A good o\' skate shop.',
        level: Level::EPIC,
        created_by: User.find_by(name: 'Cris'),
        color: '#438D80'
      },
      {
        name: 'Keith\'s Boat Shop.',
        is_private: true,
        description: 'Vehicle Store.  Sells more than just boats!',
        level: Level::RARE,
        created_by: User.find_by(name: 'Keith'),
        color: '#663300'
      },
      {
        name: 'Spawnville Zoo',
        is_private: true,
        description: 'Kerry\'s first request.',
        level: Level::RARE,
        created_by: User.find_by(name: 'Kerry'),
        color: '#663300'
      }
    ]
  end

  def self.welcome_center_inventory
    [
      {
        type: 'Item::Crafted::Book',
        description: 'Welcome to Crafty! Grab your starting items from the Welcome Center. ' \
          'Equip a vehicle to travel, a crafting tool to craft, etc... ' \
          'Gather or craft some items, sell them to other players in a building. ' \
          'Items come in levels. Higher level items are better. ',
        name: 'Gameplay Guide',
        level: Level::COMMON,
        color: '#800000',
        created_by: User.first
      },
      {
        type: 'Item::Crafted::Vehicle::HoverBike',
        description: 'An old bike with a rusty trailer.',
        name: 'Rusty',
        level: Level::COMMON,
        color: '#ffcccc',
        created_by: User.first
      },
      {
        type: 'Item::Crafted::Tool::GatheringTool',
        name: 'Universal',
        description: 'Magical seeming tech.  Can gather from any resource.',
        level: Level::LEGENDARY,
        color: 'gold',
        created_by: User.first
      },
      {
        type: 'Item::Crafted::Tool::CraftingTool',
        name: 'Universal',
        description: 'Magical seeming tech.  Can craft any item.',
        level: Level::LEGENDARY,
        color: 'gold',
        created_by: User.first
      }
    ]
  end
end
