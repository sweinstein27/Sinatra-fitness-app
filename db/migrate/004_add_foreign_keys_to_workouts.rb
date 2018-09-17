class AddForeignKeysToWorkouts < ActiveRecord::Migration
  def change
    add_column :workouts, :user_id, :integer
    add_column :workouts, :exercise_id, :integer
  end
end
