class Resource < ApplicationRecord
  include HasLevels

  validates :name, presence: true
  validates :type, presence: true

  belongs_to :location

  def gather
    raise CraftyError, ErrorMessage::GENERIC[:interface_method]
  end

  private

  def item_level
    rand(Level::COMMON..level)
  end
end
