FactoryBot.define do
  factory :listing do
    created_by factory: :user
    building factory: :craftable_building
    item factory: :gatherable_fish
    price { rand 1..100 }
  end
end
