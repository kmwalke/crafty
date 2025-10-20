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
Level.populate_levels
UserStatus.populate_statuses
ResourceType.populate_types
ItemType.populate_types
stdout_logger.warn '...DONE'

stdout_logger.warn 'PROVISIONING LOCATIONS...'
LocationUtil.provision_locations
stdout_logger.warn '...DONE'

stdout_logger.warn 'PROVISIONING USERS...'
[
  User.build(email: 'kmwalke@gmail.com', name: 'Kent', location: Location.first,
             status: UserStatus::STATUSES[:crafting]),
  User.build(email: 'kfretz2@gmail.com', name: 'Keith', location: Location.first, status: UserStatus::STATUSES[:traveling]),
  User.build(email: 'cristin.slaymaker@gmail.com', name: 'Cris', location: Location.first),
  User.build(email: 'buttforker@gmail.com', name: 'Zack', location: Location.first),
  User.build(email: 'Aaron.m.lee.al@gmail.com', name: 'Aaron', location: Location.first),
  User.build(email: 'a@b.com', name: 'Lumber Jack', location: Location.last, status: UserStatus::STATUSES[:gathering]),
  User.build(email: 'b@b.com', name: 'Shifty Rogue', location: Location.last,
             status: UserStatus::STATUSES[:traveling])
].each do |user|
  UserUtil.provision_user(user)
end
stdout_logger.warn '...DONE'
stdout_logger.warn ''
stdout_logger.warn 'PROVISIONING ITEMS...'
ItemUtil.provision_items
stdout_logger.warn '...DONE'
stdout_logger.warn ''
stdout_logger.warn '...DATA SEEDING DONE'
