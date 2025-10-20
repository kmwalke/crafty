class UserUtil
  def self.provision_user(user)
    user.password = '123'
    user.save

    create_item(
      user,
      Item::Craftable::Vehicle.new(
        description: 'An old bike with a rusty trailer.', name: 'Bicycle', level: Level::COMMON, color: '#ffcccc', created_by: user
      )
    )

    create_item(
      user,
      Item::Craftable::Tool::GatheringTool.new(
        name: 'Universal Extractor', description: 'Magical seeming tech.  Can gather from any resource.', level: Level::LEGENDARY, color: 'gold', created_by: user
      )
    )

    user
  end

  def self.create_item(user, item)
    user.inventory.add_item(item)
  end
end
