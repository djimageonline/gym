class AddUserIdToExercise < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :user_id, :integer
  end
end
