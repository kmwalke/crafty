FactoryBot.define do
  factory :room do
    sequence(:name) { |n| "Room_#{n}" }
    dungeon
    level { Level::NUMBERS.sample }
  end
end
