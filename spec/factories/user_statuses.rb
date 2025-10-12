FactoryBot.define do
  factory :user_status do
    name { UserStatus::STATUSES[:resting] }
  end
end
