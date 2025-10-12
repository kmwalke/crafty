FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item_#{n}" }
    description { 'MyText' }
    level { Item::LEVELS.sample }
    created_by factory: :user
    inventory
  end
end
