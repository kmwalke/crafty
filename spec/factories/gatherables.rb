FactoryBot.define do
  factory :gatherable, class: 'Item::Gatherable', parent: :item do
    sequence(:name) { |n| "Gatherable_#{n}" }
    sequence(:description) { |n| "This is the description for Gatherable_#{n}" }

    factory :shard, class: 'Item::Gatherable::Shard' do
      sequence(:name) { |n| "Gathering_Tool_#{n}" }
      sequence(:description) { |n| "This is the description for Gathering_Tool_#{n}" }
    end
  end
end
