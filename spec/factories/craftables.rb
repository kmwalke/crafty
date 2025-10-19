FactoryBot.define do
  factory :craftable, class: 'Item::Craftable', parent: :item do
    sequence(:name) { |n| "Craftable_#{n}" }
    sequence(:description) { |n| "This is the description for Craftable_#{n}" }

    factory :craftable_building, class: ItemType::TYPES[:craftable_building] do
      sequence(:name) { |n| "Building_#{n}" }
      sequence(:description) { |n| "This is the description for Building_#{n}" }
    end

    factory :craftable_vehicle, class: ItemType::TYPES[:craftable_vehicle] do
      sequence(:name) { |n| "Vehicle_#{n}" }
      sequence(:description) { |n| "This is the description for Vehicle_#{n}" }
    end
  end
end
