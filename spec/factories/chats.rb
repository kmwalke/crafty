FactoryBot.define do
  factory :chat do
    user
    location
    sequence(:content) { |n| "This is chat message number #{n}" }
  end
end
