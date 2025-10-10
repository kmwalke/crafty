FactoryBot.define do
  factory :vehicle do
    type { 'Vehicle' }
    sequence(:name) { |n| "User_#{n}" }
    description { 'MyText' }
    level { Item::LEVELS.sample }
    created_by factory: :user
    inventory
  end
end
