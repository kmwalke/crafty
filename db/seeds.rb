# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'CREATING CONSTANTS...'
UserStatus.populates_statuses
ResourceType.populates_types
puts '...DONE'

puts 'PROVISIONING LOCATIONS...'
LocationUtil.provision_locations
puts '...DONE'

puts 'PROVISIONING USERS...'
[
  { email: 'kmwalke@gmail.com', name: 'Kent', location: Location.first },
  { email: 'kfretz2@gmail.com', name: 'Keith', location: Location.first },
  { email: 'a@b.com', name: 'Lumber Jack', location: Location.last },
  { email: 'b@b.com', name: 'Shifty Rogue', location: Location.last }
].each do |info|
  UserUtil.provision_user(email: info[:email], name: info[:name], location: info[:location])
end
puts '...DONE'
