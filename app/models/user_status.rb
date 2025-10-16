class UserStatus < ApplicationRecord
  validates :name, presence: true

  STATUSES = {
    mining: 'Mining',
    resting: 'Resting',
    traveling: 'Traveling'
  }.freeze

  STATUS_NAMES = STATUSES.values.freeze

  def self.populate_statuses
    UserStatus::STATUS_NAMES.each do |status|
      UserStatus.find_or_create_by(name: status)
    end
  end
end
