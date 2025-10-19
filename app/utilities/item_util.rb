class ItemUtil
  def self.provision_items
    building_data.each do |building|
      Location.first.add_building(building)
    end
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
