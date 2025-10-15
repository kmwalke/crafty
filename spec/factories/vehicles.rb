FactoryBot.define do
  factory :vehicle, class: Item::Vehicle do
    type { ItemType::TYPES[:vehicle] }
    sequence(:name) { |n| "Vehicle_#{n}" }
    sequence(:description) { |n| "This is the description for Vehicle_#{n}" }
    level { Item::LEVELS.sample }
    created_by factory: :user
    inventory
  end
end
