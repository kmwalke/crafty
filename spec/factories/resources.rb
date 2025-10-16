FactoryBot.define do
  factory :resource do
    sequence(:name) { |n| "Resource_#{n}" }
    location
    type { ResourceType::TYPE_NAMES.sample }
    level { Level::NUMBERS.sample }
  end
end
