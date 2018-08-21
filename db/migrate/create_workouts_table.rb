class CreateWorkoutsTable < ActiveRecord::Migration[4.2]
  def change
    create_table :workouts do |t|
      t.text :exercise
      t.integer :sets
      t.integer :weight
      t.integer :user_id
    end
  end
end
