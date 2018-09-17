class WorkoutsController < ApplicationController

  get '/workouts/show' do
    if logged_in?
      binding.pry

      erb :'workouts/show'
    else
      redirect to '/login'
    end
  end

end
