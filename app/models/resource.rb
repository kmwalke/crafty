class Resource < ApplicationRecord
  validates :name, presence: true
  validates :type, presence: true

  belongs_to :location

  def gather
    raise 'Not Implemented.'
  end

  private

  def item_level
    rand(Level::COMMON..level)
  end
end
