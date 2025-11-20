class Item < ApplicationRecord
  include HasLevels

  before_create :set_defaults
  after_save :destroy_if_stack_zero

  validates :name, presence: true
  validates :level, presence: true

  belongs_to :created_by, class_name: 'User'

  belongs_to :child_inventory, class_name: 'Inventory', optional: true
  belongs_to :parent_inventory, class_name: 'Inventory', optional: true

  DEFAULT_COLOR = '#EEE'.freeze
  DEFAULT_DESC  = 'This is the item description.'.freeze

  def permitted_user?(user)
    created_by == user || !is_private
  end

  def boosted?
    boost.positive?
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

  def inventory_available?
    !child_inventory.nil? && child_inventory.remaining_space.positive?
  end

  private

  def set_defaults
    self.color       ||= DEFAULT_COLOR
    self.description ||= DEFAULT_DESC
  end

  def destroy_if_stack_zero
    destroy if stack_amount <= 0
  end
end
