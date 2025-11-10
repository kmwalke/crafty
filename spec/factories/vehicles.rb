FactoryBot.define do
  factory :vehicle, class: 'Item::Crafted::Vehicle', parent: :item do
    name { raise CraftyError, 'Dont use this parent factory.  Use one of the children' }

    factory :vehicle_hover_bike, class: ItemType::VEHICLES[:hover_bike] do
      sequence(:name) { |n| "HoverBike_#{n}" }
      type { ItemType::VEHICLES[:hover_bike] }
    end

    factory :vehicle_mount, class: ItemType::VEHICLES[:mount] do
      sequence(:name) { |n| "Mount_#{n}" }
      type { ItemType::VEHICLES[:mount] }
    end
  end
end
