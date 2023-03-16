class Exercise < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, length: {minimum: 10}
end
