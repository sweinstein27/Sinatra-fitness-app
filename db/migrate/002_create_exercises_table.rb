class CreateExercisesTable < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.text :exercise
      t.integer :sets
      t.integer :weight
    end
  end
end
