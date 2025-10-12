FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item_#{n}" }
    sequence(:description) { |n| "This is the description for Item_#{n}" }
    level { Item::LEVELS.sample }
    created_by factory: :user
    inventory
  end
end
