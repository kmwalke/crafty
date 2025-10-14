# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stdout_logger           = ActiveSupport::Logger.new($stdout)

stdout_logger.warn 'SEEDING DATA...'
stdout_logger.warn ''
stdout_logger.warn 'CREATING CONSTANTS...'
UserStatus.populates_statuses
ResourceType.populates_types
stdout_logger.warn '...DONE'

stdout_logger.warn 'PROVISIONING LOCATIONS...'
LocationUtil.provision_locations
stdout_logger.warn '...DONE'

stdout_logger.warn 'PROVISIONING USERS...'
[
  { email: 'kmwalke@gmail.com', name: 'Kent', location: Location.first },
  { email: 'kfretz2@gmail.com', name: 'Keith', location: Location.first },
  { email: 'cristin.slaymaker@gmail.com', name: 'Cris', location: Location.first },
  { email: 'buttforker@gmail.com', name: 'Zack', location: Location.first },
  { email: 'Aaron.m.lee.al@gmail.com', name: 'Aaron', location: Location.first },
  { email: 'a@b.com', name: 'Lumber Jack', location: Location.last },
  { email: 'b@b.com', name: 'Shifty Rogue', location: Location.last }
].each do |info|
  UserUtil.provision_user(email: info[:email], name: info[:name], location: info[:location])
end
stdout_logger.warn '...DONE'
stdout_logger.warn ''
stdout_logger.warn '...DATA SEEDING DONE'
