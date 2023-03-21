class AddColumnExerciseTypeToExercises < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :exercise_type, :string
  end
end
