class AddColumnTypeToExercise < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :type, :string
    add_column :exercises, :muscle, :string
    add_column :exercises, :equipment, :string
    add_column :exercises, :difficulty, :string
    add_column :exercises, :instructions, :string
  end
end
