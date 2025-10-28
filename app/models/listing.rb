class Listing < ApplicationRecord
  belongs_to :building, class_name: 'Item::Craftable::Building'
  belongs_to :created_by, class_name: 'User'
  belongs_to :item
end
