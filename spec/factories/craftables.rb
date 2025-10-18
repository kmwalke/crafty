FactoryBot.define do
  factory :craftable, class: 'Item::Craftable', parent: :item do
    sequence(:name) { |n| "Craftable_#{n}" }
    sequence(:description) { |n| "This is the description for Craftable_#{n}" }

    factory :craftable_building, class: 'Item::Craftable::Building' do
      sequence(:name) { |n| "Building_#{n}" }
      sequence(:description) { |n| "This is the description for Building_#{n}" }
    end
  end
end
