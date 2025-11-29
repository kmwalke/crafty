class UserStatus < ApplicationRecord
  validates :name, presence: true

  STATUSES = {
    crafting: 'Crafting',
    gathering: 'Gathering',
    questing: 'Questing',
    resting: 'Resting',
    traveling: 'Traveling'
  }.freeze

  STATUS_NAMES = STATUSES.values.freeze

  def self.populate
    UserStatus::STATUS_NAMES.each do |status|
      UserStatus.find_or_create_by(name: status)
    end
  end
end
