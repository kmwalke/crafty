FactoryBot.define do
  factory :tool, class: 'Item::Craftable::Tool', parent: :item do
    sequence(:name) { |n| "Tool_#{n}" }
    sequence(:description) { |n| "This is the description for Tool_#{n}" }

    factory :gathering_tool, class: 'Item::Craftable::Tool::GatheringTool' do
      sequence(:name) { |n| "Gathering_Tool_#{n}" }
      sequence(:description) { |n| "This is the description for Gathering_Tool_#{n}" }
    end
  end
end
