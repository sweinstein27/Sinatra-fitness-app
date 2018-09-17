class WorkoutssController < ApplicationController

  get '/workouts/:id' do
    if logged_in?
      binding.pry
      @workout= Exercise.where("workout_id = ?", @workout.id)
      erb :'exercises/show_exercise'
    else
      redirect to '/login'
    end
  end

end
