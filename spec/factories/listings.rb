FactoryBot.define do
  factory :listing do
    item_id { 1 }
    created_by_id { 1 }
    price_type { "MyString" }
    price_amount { 1 }
    price_level { 1 }
  end
end
