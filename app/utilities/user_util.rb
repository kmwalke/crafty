class UserUtil
  def self.provision_user(name: nil, email: nil, location: nil, password: '123')
    user = User.create(email:, name:, password:, location:)
    create_vehicle(user:, description: 'Simple walking shoes.', name: 'Shoes', level: 0, color: '#ffcccc')
    item_data.each do |datum|
      create_item(
        user:,
        name: datum[:name],
        description: datum[:description],
        level: datum[:level],
        color: datum[:color]
      )
    end

    user
  end

  def self.create_vehicle(user: nil, name: nil, description: nil, level: 0, color: nil)
    create_item(user:, name:, description:, level:, type: 'Vehicle', color:)
  end

  def self.create_item(user: nil, name: nil, description: nil, level: 0, type: nil, color: nil)
    user.inventory.add_item(created_by: user, description:, name:, level:, type:, color:)
  end

  def self.item_data
    [
      { description: 'A small, crooked stick.', name: 'Bent Stick', level: 0, color: '#996633' },
      { description: 'You can\'t remember where you found this.', name: 'Dented Copper', level: 0, color: '#e4be9b' },
      { description: 'An old flame gave you this.', name: 'Wilted Flower', level: 0, color: 'grey' }
    ]
  end
end
