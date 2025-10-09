FactoryBot.define do
  factory :location do
    sequence(:name) { |n| "Location_#{n}" }
    pos_x { rand(100) }
    pos_y { rand(100) }
    description { 'This is the description.' }
  end
end
