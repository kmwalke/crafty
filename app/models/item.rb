class Item < ApplicationRecord
  include HasLevels

  before_create :set_defaults

  validates :name, presence: true
  validates :level, presence: true

  belongs_to :created_by, class_name: 'User'

  belongs_to :child_inventory, class_name: 'Inventory', optional: true
  belongs_to :inventory, optional: true

  DEFAULT_COLOR = '#EEE'.freeze
  DEFAULT_DESC  = 'This is the item description.'.freeze

  def recipe
    [
      'Coming Soon'
    ]
  end

  def permitted_user?(user)
    created_by == user || !is_private
  end

  def full_name
    "#{name} #{pretty_type}"
  end

  def full_name_level
    "#{Level.level_name level} #{full_name}"
  end

  def pretty_type
    type.split('::').last
  end

  def equippable?
    false
  end

  def useable?
    false
  end

  private

  def set_defaults
    self.color       ||= DEFAULT_COLOR
    self.description ||= DEFAULT_DESC
  end
end
