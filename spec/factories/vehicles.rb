FactoryBot.define do
  factory :vehicle do
    type { 'Vehicle' }
    sequence(:name) { |n| "Vehicle_#{n}" }
    description { 'MyText' }
    level { Item::LEVELS.sample }
    created_by factory: :user
    inventory
  end
end
