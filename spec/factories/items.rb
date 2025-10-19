FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item_#{n}" }
    sequence(:description) { |n| "This is the description for Item_#{n}" }
    level { Level::NUMBERS.sample }
    type { ItemType::TYPE_NAMES.sample }
    created_by factory: :user
    inventory
  end
end
