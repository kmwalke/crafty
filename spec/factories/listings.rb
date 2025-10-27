FactoryBot.define do
  factory :listing do
    created_by factory: :user
    building factory: :craftable_building
    item
    price_type { ItemType::TYPE_NAMES.sample }
    price_amount { rand 1..100 }
    price_level { Level::NUMBERS.sample }
  end
end
