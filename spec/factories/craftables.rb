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

    factory :crafted_hover_bike, class: ItemType::CRAFTED[:hover_bike] do
      sequence(:name) { |n| "HoverBike_#{n}" }
      sequence(:description) { |n| "This is the description for HoverBike_#{n}" }
    end
  end
end
