FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item_#{n}" }
    sequence(:description) { |n| "This is the description for Item_#{n}" }
    level { Level::NUMBERS.sample }
    created_by factory: :user
    parent_inventory factory: :inventory

    factory :generic_item do
      type { ItemType::CRAFTED.values.sample }
    end
  end
end
