class Resource < ApplicationRecord
  include HasLevels

  validates :name, presence: true
  validates :type, presence: true

  belongs_to :location

  def full_name
    "#{name} #{type.split('::').last}"
  end

  def gather
    raise CraftyError, ErrorMessage::GENERIC[:interface_method]
  end

  private

  def item_level
    rand(Level::COMMON..level)
  end
end
