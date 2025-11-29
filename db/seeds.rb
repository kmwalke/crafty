# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stdout_logger = ActiveSupport::Logger.new($stdout)

stdout_logger.warn 'SEEDING DATA...'
stdout_logger.warn ''

stdout_logger.warn 'CREATING CONSTANTS...'
Level.populate
UserStatus.populate
ResourceType.populate
ItemType.populate
stdout_logger.warn '...DONE'
stdout_logger.warn ''

stdout_logger.warn 'PROVISIONING LOCATIONS...'
LocationUtil.provision
stdout_logger.warn '...DONE'
stdout_logger.warn ''

stdout_logger.warn 'PROVISIONING USERS...'
UserUtil.provision
stdout_logger.warn '...DONE'
stdout_logger.warn ''

stdout_logger.warn 'PROVISIONING ITEMS...'
ItemUtil.provision
stdout_logger.warn '...DONE'
stdout_logger.warn ''

stdout_logger.warn 'PROVISIONING DUNGEONS...'
DungeonUtil.provision
stdout_logger.warn '...DONE'
stdout_logger.warn ''

stdout_logger.warn '...DATA SEEDING DONE'
