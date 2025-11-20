FactoryBot.define do
  factory :crafted_bag, class: 'Item::Crafted::Bag', parent: :crafted do
    sequence(:name) { |n| "Bag_#{n}" }
  end
end
