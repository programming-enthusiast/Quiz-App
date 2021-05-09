FactoryGirl.define do
  factory :category do
    name Faker::Lorem.characters(number: 30)
  end
end
