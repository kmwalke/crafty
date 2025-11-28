FactoryBot.define do
  factory :dungeon do
    sequence(:name) { |n| "Dungeon_#{n}" }
    location
  end
end
