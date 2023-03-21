class Routine < ApplicationRecord
belongs_to :user
has_many :exercise_routines
has_many :exercises, through: :exercise_routines


end
