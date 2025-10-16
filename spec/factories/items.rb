FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item_#{n}" }
    sequence(:description) { |n| "This is the description for Item_#{n}" }
    level { Level::NUMBERS.sample }
    created_by factory: :user
    inventory

    factory :gathering_tool, class: 'Item::Tool::GatheringTool' do
      sequence(:name) { |n| "Gathering_Tool_#{n}" }
      sequence(:description) { |n| "This is the description for Gathering_Tool_#{n}" }
    end
  end
end
