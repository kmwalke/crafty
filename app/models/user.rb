class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  DEFAULT_ENERGY = 1000

  STATUSES = {
    mining: 'Mining',
    resting: 'Resting',
    traveling: 'Traveling'
  }.freeze

  STATUS_NAMES = STATUSES.values.freeze
end
