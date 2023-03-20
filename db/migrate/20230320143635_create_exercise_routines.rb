class CreateExerciseRoutines < ActiveRecord::Migration[7.0]
  def change
    create_table :exercise_routines do |t|
      t.integer :routine_id
      t.integer :exercise_id
      t.integer :user_id

      t.timestamps
    end
  end
end
