class UserUtil
  def self.provision_user(name: nil, email: nil, location: nil, password: '123')
    user = User.create(email:, name:, password:, location:)

    create_item(
      user,
      Item::Vehicle.new(
        description: 'An old bike with a rusty trailer.', name: 'Bicycle', level: Level::COMMON, color: '#ffcccc', created_by: user
      )
    )

    create_item(
      user,
      Item::Tool::GatheringTool.new(
        name: 'Universal Extractor', description: 'Magical seeming tech.  Can gather from any resource.', level: Level::COMMON, color: 'gold', created_by: user
      )
    )

    user
  end

  def self.create_item(user, item)
    user.inventory.add_item(item)
  end
end
