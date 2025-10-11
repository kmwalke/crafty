class Location < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :pos_x, presence: true
  validates :pos_y, presence: true
  validates :description, presence: true

  has_many :users

  def distance_from(location)
    Math.sqrt(
      (
        ((location.pos_x - pos_x) ** 2) -
          ((location.pos_y - pos_y) ** 2)
      ).abs
    ).round
  end
end
