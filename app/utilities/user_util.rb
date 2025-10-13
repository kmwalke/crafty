class UserUtil
  def self.provision_user(name: nil, email: nil, location: nil, password: '123')
    user = User.create(email:, name:, password:, location:)
    create_vehicle(user:, description: 'Simple walking shoes.', name: 'Shoes', level: 0)
    item_data.each do |datum|
      create_item(user:, name: datum[:name], description: datum[:description], level: datum[:level])
    end

    user
  end

  def self.create_vehicle(user: nil, name: nil, description: nil, level: 0)
    create_item(user:, name:, description:, level:, type: Vehicle.name)
  end

  def self.create_item(user: nil, name: nil, description: nil, level: 0, type: nil)
    Item.create(
      inventory: user.inventory,
      created_by: user,
      description:,
      name:,
      level:,
      type:
    )
  end

  def self.item_data
    [
      { description: 'A small, crooked stick.', name: 'Bent Stick', level: 0 },
      { description: 'You can\'t remember where you found this.', name: 'Dented Copper', level: 0 },
      { description: 'An old flame gave you this.', name: 'Wilted Flower', level: 0 }
    ]
  end
end
