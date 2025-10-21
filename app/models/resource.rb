class Resource < ApplicationRecord
  include HasLevels

  before_save :default_values

  validates :name, presence: true
  validates :type, presence: true

  belongs_to :location

  def full_name
    "#{name} #{pretty_type}"
  end

  def pretty_type
    type.split('::').last
  end

  def gather
    raise CraftyError, ErrorMessage::GENERIC[:interface_method]
  end

  private

  def item_level
    rand(Level::COMMON..level)
  end

  def default_values
    self.color ||= default_color
  end

  def default_color
    'white'.freeze
  end
end
