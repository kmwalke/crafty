FactoryBot.define do
  factory :gatherable, class: 'Item::Gatherable', parent: :item do
    sequence(:name) { |n| "Gatherable_#{n}" }
    sequence(:description) { |n| "This is the description for Gatherable_#{n}" }

    factory :gatherable_companion, class: ItemType::TYPES[:gatherable_companion] do
      sequence(:name) { |n| "Companion_#{n}" }
      sequence(:description) { |n| "This is the description for Companion_#{n}" }
    end

    factory :gatherable_fish, class: ItemType::TYPES[:gatherable_fish] do
      sequence(:name) { |n| "Fish_#{n}" }
      sequence(:description) { |n| "This is the description for Fish_#{n}" }
    end

    factory :gatherable_flower, class: ItemType::TYPES[:gatherable_flower] do
      sequence(:name) { |n| "Flower_#{n}" }
      sequence(:description) { |n| "This is the description for Flower_#{n}" }
    end

    factory :gatherable_fruit, class: ItemType::TYPES[:gatherable_fruit] do
      sequence(:name) { |n| "Fruit_#{n}" }
      sequence(:description) { |n| "This is the description for Fruit_#{n}" }
    end

    factory :gatherable_ore, class: ItemType::TYPES[:gatherable_ore] do
      sequence(:name) { |n| "Ore_#{n}" }
      sequence(:description) { |n| "This is the description for Ore_#{n}" }
    end

    factory :gatherable_shard, class: ItemType::TYPES[:gatherable_shard] do
      sequence(:name) { |n| "Shard_#{n}" }
      sequence(:description) { |n| "This is the description for Shard_#{n}" }
    end

    factory :gatherable_wood, class: ItemType::TYPES[:gatherable_wood] do
      sequence(:name) { |n| "Wood_#{n}" }
      sequence(:description) { |n| "This is the description for Wood_#{n}" }
    end
  end
end
