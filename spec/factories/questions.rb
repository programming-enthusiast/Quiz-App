FactoryGirl.define do
  factory :question do
    text Faker::Lorem.sentence
    quiz
  end
end
