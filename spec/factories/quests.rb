FactoryBot.define do
  factory :quest do
    sequence(:name) { |n| "Quest_#{n}" }
    level { Level::NUMBERS.sample }
    location
    dungeon
    reward_credits { 1 }
  end
end
