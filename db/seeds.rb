# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'kmwalke@gmail.com', name: 'Kent', password: '123')

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
      pos_x: 1,
      pos_y: 5,
      description: 'desc'
    },
    {
      name: 'Harsh Desert',
      pos_x: 20,
      pos_y: 7,
      description: 'desc'
    },
    {
      name: 'Dark Forest',
      pos_x: 8,
      pos_y: -2,
      description: 'desc'
    }
  ]
)
