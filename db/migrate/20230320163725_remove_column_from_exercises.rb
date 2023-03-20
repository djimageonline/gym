class RemoveColumnFromExercises < ActiveRecord::Migration[7.0]
  def change
    remove_column :exercises, :description, :text
    remove_column :exercises, :video_url, :string
    remove_column :exercises, :instructions, :string
  end
end
