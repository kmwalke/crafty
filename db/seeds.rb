# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserStatus.populates_statuses

Location.create(
  [
    {
      name: 'Starting City',
      pos_x: 0,
      pos_y: 0,
      description: 'desc'
    },
    {
      name: 'Rolling Hills',
      pos_x: 10,
      pos_y: 57,
      description: 'desc'
    },
    {
      name: 'Harsh Desert',
      pos_x: 20,
      pos_y: 78,
      description: 'desc'
    },
    {
      name: 'Dark Forest',
      pos_x: 89,
      pos_y: -62,
      description: 'desc'
    }
  ]
)

[
  { email: 'kmwalke@gmail.com', name: 'Kent', location: Location.first },
  { email: 'a@b.com', name: 'Lumber Jack', location: Location.last },
  { email: 'b@b.com', name: 'Shifty Rogue', location: Location.last }
].each do |info|
  user = User.create(email: info[:email], name: info[:name], password: '123', location: info[:location])
  Vehicle.create(inventory: user.inventory, created_by: user, description: 'desc', name: 'Shoes', level: 0)
end
