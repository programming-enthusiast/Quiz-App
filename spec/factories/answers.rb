FactoryGirl.define do
  factory :answer do
    text Faker::Lorem.sentence
    correct false
    question
  end
end
