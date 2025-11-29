FactoryBot.define do
  factory :dungeon do
    sequence(:name) { |n| "Dungeon_#{n}" }
    location

    trait :with_rooms do
      after(:create) do |dungeon|
        create_list(:room, 3, dungeon:)
      end
    end
  end
end
