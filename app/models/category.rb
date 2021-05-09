class Category < ApplicationRecord
  has_many :quizzes

  validates :name, presence: true
end
