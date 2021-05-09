class User < ApplicationRecord
  has_many :quizzes, dependent: :destroy
  has_many :scores, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
end
