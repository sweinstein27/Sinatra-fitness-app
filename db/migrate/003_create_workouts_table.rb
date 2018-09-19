class CreateWorkoutsTable < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :date
      t.integer :user_id

    end
  end
end
