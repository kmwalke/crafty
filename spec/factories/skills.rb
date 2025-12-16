FactoryBot.define do
  factory :skills do
    user
    crafting { rand(1..Skills::MAX_LEVEL) }
    fighting { rand(1..Skills::MAX_LEVEL) }
    gathering { rand(1..Skills::MAX_LEVEL) }
    trading { rand(1..Skills::MAX_LEVEL) }
    traveling { rand(1..Skills::MAX_LEVEL) }
  end
end
