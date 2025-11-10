FactoryBot.define do
  factory :crafted, class: 'Item::Crafted', parent: :item do
    name { raise CraftyError, 'Dont use this parent factory.  Use one of the children' }

    factory :crafted_beam, class: ItemType::CRAFTED[:beam] do
      sequence(:name) { |n| "Beam_#{n}" }
    end

    factory :crafted_book, class: ItemType::CRAFTED[:book] do
      sequence(:name) { |n| "Book_#{n}" }
    end

    factory :crafted_building, class: ItemType::CRAFTED[:building] do
      sequence(:name) { |n| "Building_#{n}" }
    end

    factory :crafted_component, class: ItemType::CRAFTED[:component] do
      sequence(:name) { |n| "Component_#{n}" }
    end

    factory :crafted_frame, class: ItemType::CRAFTED[:frame] do
      sequence(:name) { |n| "Frame_#{n}" }
    end

    factory :crafted_harness, class: ItemType::CRAFTED[:harness] do
      sequence(:name) { |n| "Harness_#{n}" }
    end

    factory :crafted_ingot, class: ItemType::CRAFTED[:ingot] do
      sequence(:name) { |n| "Ingot_#{n}" }
    end

    factory :crafted_leather, class: ItemType::CRAFTED[:leather] do
      sequence(:name) { |n| "Ingot_#{n}" }
    end

    factory :crafted_orb, class: ItemType::CRAFTED[:orb] do
      sequence(:name) { |n| "Orb_#{n}" }
    end

    factory :crafted_paper, class: ItemType::CRAFTED[:paper] do
      sequence(:name) { |n| "Paper_#{n}" }
    end

    factory :crafted_pelt, class: ItemType::CRAFTED[:pelt] do
      sequence(:name) { |n| "Pelt_#{n}" }
    end

    factory :crafted_plank, class: ItemType::CRAFTED[:plank] do
      sequence(:name) { |n| "Plank_#{n}" }
    end

    factory :crafted_plastic, class: ItemType::CRAFTED[:plastic] do
      sequence(:name) { |n| "Plastic_#{n}" }
    end

    factory :crafted_salad, class: ItemType::CRAFTED[:salad] do
      sequence(:name) { |n| "Salad_#{n}" }
    end

    factory :crafted_screw, class: ItemType::CRAFTED[:screw] do
      sequence(:name) { |n| "Screw_#{n}" }
    end
  end
end
