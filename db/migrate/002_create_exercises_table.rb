class CreateExercisesTable < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.text :exercise
      t.integer :sets
      t.integer :weight
      t.integer :user_id
      t.integer :workout_id
    end
  end
end
