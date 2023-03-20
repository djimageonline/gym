class Exercise < ApplicationRecord
  has_many :routines, through: :exercise_routines
  has_many :exercise_routines
 
end
