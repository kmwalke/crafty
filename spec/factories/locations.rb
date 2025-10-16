FactoryBot.define do
  factory :location do
    sequence(:name) { |n| "Location_#{n}" }
    pos_x { rand(100) }
    pos_y do
      y = rand(100)
      y = rand(100) while Location.pluck(:pos_y).include?(y)
      y
    end
    sequence(:description) { |n| "This is the description for Location_#{n}" }
  end
end
