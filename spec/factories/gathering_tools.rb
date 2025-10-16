FactoryBot.define do
  factory :gathering_tool, class: 'Item::Tool::GatheringTool' do
    type { Item::ToolSubtype::TYPES[:gathering_tool] }
    sequence(:name) { |n| "Gathering_Tool_#{n}" }
    sequence(:description) { |n| "This is the description for Gathering_Tool_#{n}" }
    level { Level::NUMBERS.sample }
    created_by factory: :user
    inventory
  end
end
