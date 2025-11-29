FactoryBot.define do
  factory :dungeon do
    sequence(:name) { |n| "Dungeon_#{n}" }
    location

    trait :with_rooms do
      after(:create) do |dungeon|
        3.times { dungeon.rooms << create(:room) }
      end
    end
  end
end
