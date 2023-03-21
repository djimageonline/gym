class RemoveColumnTypeFromExercises < ActiveRecord::Migration[7.0]
  def change
    remove_column :exercises, :type, :string
  end
end
