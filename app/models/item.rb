class Item < ApplicationRecord
  include HasLevels

  before_create :set_color

  validates :name, presence: true
  validates :description, presence: true
  validates :level, presence: true

  belongs_to :inventory
  belongs_to :created_by, class_name: 'User'

  DEFAULT_COLOR = '#EEE'.freeze

  def equipable?
    ItemType::TYPE_NAMES.include? type
  end

  private

  def set_color
    self.color ||= DEFAULT_COLOR
  end
end
