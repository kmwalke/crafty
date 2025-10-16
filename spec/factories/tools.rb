FactoryBot.define do
  factory :tool, class: 'Item::Tool' do
    subtype { Item::ToolSubtype::TYPE_NAMES.sample }
    sequence(:name) { |n| "Tool_#{n}" }
    sequence(:description) { |n| "This is the description for Tool_#{n}" }
    level { Level::NUMBERS.sample }
    created_by factory: :user
    inventory
  end
end
