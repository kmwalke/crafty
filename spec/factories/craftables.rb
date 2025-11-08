FactoryBot.define do
  factory :crafted, class: 'Item::Crafted', parent: :item do
    sequence(:name) { |n| "Crafted_#{n}" }
    sequence(:description) { |n| "This is the description for Crafted_#{n}" }

    factory :crafted_building, class: ItemType::CRAFTED[:building] do
      sequence(:name) { |n| "Building_#{n}" }
      sequence(:description) { |n| "This is the description for Building_#{n}" }
    end

    factory :crafted_salad, class: ItemType::CRAFTED[:salad] do
      sequence(:name) { |n| "Salad_#{n}" }
      sequence(:description) { |n| "This is the description for Salad_#{n}" }
    end

    factory :crafted_vehicle, class: ItemType::CRAFTED[:vehicle] do
      sequence(:name) { |n| "Vehicle_#{n}" }
      sequence(:description) { |n| "This is the description for Vehicle_#{n}" }
    end
  end
end
