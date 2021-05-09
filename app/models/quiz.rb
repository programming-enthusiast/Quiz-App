class Quiz < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :scores, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :title, presence: true

  scope :published, -> { where(published: true) }
end
