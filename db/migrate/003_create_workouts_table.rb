class CreateWorkoutsTable < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :date

    end
  end
end
