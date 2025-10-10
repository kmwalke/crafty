FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "User_#{n}" }
    description { 'MyText' }
    level { Item::LEVELS.sample }
  end
end
