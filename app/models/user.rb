class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  STATUSES = {
    mining: 'Mining',
    resting: 'Resting',
    traveling: 'Traveling'
  }.freeze

  STATUS_NAMES = STATUSES.values.freeze
end
