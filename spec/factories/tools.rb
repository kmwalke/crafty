FactoryBot.define do
  factory :tool, class: 'Item::Crafted::Tool', parent: :item do
    name { raise CraftyError, 'Dont use this parent factory.  Use one of the children' }

    factory :gathering_tool, class: ItemType::TOOLS[:gathering_tool] do
      sequence(:name) { |n| "Gathering_Tool_#{n}" }
    end

    factory :crafting_tool, class: ItemType::TOOLS[:crafting_tool] do
      sequence(:name) { |n| "Crafting_Tool_#{n}" }
    end
  end
end
