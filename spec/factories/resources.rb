FactoryBot.define do
  factory :resource do
    sequence(:name) { |n| "Resource_#{n}" }
    location
    type { ResourceType::TYPE_NAMES.sample }
    level { Level::NUMBERS.sample }

    factory :crystal, class: 'Resource::Crystal' do
      type { ResourceType::TYPES[:crystal] }
    end

    factory :fish, class: 'Resource::Fish' do
      type { ResourceType::TYPES[:fish] }
    end

    factory :forest, class: 'Resource::Forest' do
      type { ResourceType::TYPES[:forest] }
    end

    factory :bush, class: 'Resource::Bush' do
      type { ResourceType::TYPES[:bush] }
    end

    factory :herd, class: 'Resource::Herd' do
      type { ResourceType::TYPES[:herd] }
    end

    factory :meadow, class: 'Resource::Meadow' do
      type { ResourceType::TYPES[:meadow] }
    end

    factory :ore, class: 'Resource::Ore' do
      type { ResourceType::TYPES[:ore] }
    end
  end
end
