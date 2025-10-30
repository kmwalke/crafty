class Item < ApplicationRecord
  include HasLevels

  before_create :set_color

  validates :name, presence: true
  validates :description, presence: true
  validates :level, presence: true

  belongs_to :created_by, class_name: 'User'

  belongs_to :child_inventory, class_name: 'Inventory', optional: true
  belongs_to :inventory

  DEFAULT_COLOR = '#EEE'.freeze

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

  def equipable?
    false
  end

  private

  def set_color
    self.color ||= DEFAULT_COLOR
  end
end
