class UserUtil
  def self.provision_user(name: nil, email: nil, location: nil, password: '123')
    user = User.create(email:, name:, password:, location:)
    create_item(
      user,
      Vehicle.new(
        description: 'Simple walking shoes.', name: 'Shoes', level: 0, color: '#ffcccc', created_by: user
      )
    )

    item_data.each do |datum|
      create_item(
        user,
        Item.new(
          name: datum[:name],
          description: datum[:description],
          level: datum[:level],
          color: datum[:color],
          created_by: user
        )
      )
    end

    user
  end

  def self.create_item(user, item)
    user.inventory.add_item(item)
  end

  def self.item_data
    [
      { description: 'A small, crooked stick.', name: 'Bent Stick', level: 0, color: '#996633' },
      { description: 'You can\'t remember where you found this.', name: 'Dented Copper', level: 0, color: '#e4be9b' },
      { description: 'An old flame gave you this.', name: 'Wilted Flower', level: 0, color: 'grey' }
    ]
  end
end
