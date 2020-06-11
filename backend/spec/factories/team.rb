FactoryBot.define do
  factory :team do
    name { "My team" }
    sequence(:abbreviation) { |n| "T#{n}" }
  end
end
