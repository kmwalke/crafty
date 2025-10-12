FactoryBot.define do
  factory :vehicle do
    type { Vehicle.name }
    sequence(:name) { |n| "Vehicle_#{n}" }
    sequence(:description) { |n| "This is the description for Vehicle_#{n}" }
    level { Item::LEVELS.sample }
    created_by factory: :user
    inventory
  end
end
