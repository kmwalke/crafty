FactoryBot.define do
  factory :tool, class: ItemType::CRAFTABLE[:tool], parent: :item do
    sequence(:name) { |n| "Tool_#{n}" }
    sequence(:description) { |n| "This is the description for Tool_#{n}" }

    factory :craftable_tool_gathering_tool, class: ItemType::TOOLS[:gathering_tool] do
      sequence(:name) { |n| "Gathering_Tool_#{n}" }
      sequence(:description) { |n| "This is the description for Gathering_Tool_#{n}" }
    end
  end
end
