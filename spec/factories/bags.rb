FactoryBot.define do
  factory :crafted_pet, class: 'Item::Crafted::Pet', parent: :crafted do
    sequence(:name) { |n| "Pet_#{n}" }
  end
end
