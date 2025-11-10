FactoryBot.define do
  factory :gatherable, class: 'Item::Gatherable', parent: :item do
    name { raise CraftyError, 'Dont use this parent factory.  Use one of the children' }

    factory :gatherable_companion, class: ItemType::GATHERABLE[:companion] do
      sequence(:name) { |n| "Companion_#{n}" }
    end

    factory :gatherable_fish, class: ItemType::GATHERABLE[:fish] do
      sequence(:name) { |n| "Fish_#{n}" }
    end

    factory :gatherable_flower, class: ItemType::GATHERABLE[:flower] do
      sequence(:name) { |n| "Flower_#{n}" }
    end

    factory :gatherable_fruit, class: ItemType::GATHERABLE[:fruit] do
      sequence(:name) { |n| "Fruit_#{n}" }
    end

    factory :gatherable_ore, class: ItemType::GATHERABLE[:ore] do
      sequence(:name) { |n| "Ore_#{n}" }
    end

    factory :gatherable_shard, class: ItemType::GATHERABLE[:shard] do
      sequence(:name) { |n| "Shard_#{n}" }
    end

    factory :gatherable_wood, class: ItemType::GATHERABLE[:wood] do
      sequence(:name) { |n| "Wood_#{n}" }
    end
  end
end
