class Check < ApplicationRecord
  belongs_to :room

  def run(player)
    false
  end
end
