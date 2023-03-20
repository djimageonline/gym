class Routine < ApplicationRecord
belongs_to :user
has_many :exercises, through: :exercise_routines
has_many :exercise_routines


end
