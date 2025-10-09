class Location < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :pos_x, presence: true
  validates :pos_y, presence: true
  validates :description, presence: true
end
