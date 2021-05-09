FactoryGirl.define do
  factory :quiz do
    title Faker::Lorem.characters(number: 30)
    description Faker::Lorem.sentence
    published true

    category
    user
  end
end
