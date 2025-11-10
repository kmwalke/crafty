FactoryBot.define do
  factory :listing do
    created_by factory: :user
    building factory: :crafted_building
    item factory: :gatherable_fish
    price { rand 1..100 }
  end
end
