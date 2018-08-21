class WorkoutsController < ApplicationController

  get '/workouts' do
    if logged_in?
      @workouts = Workout.all
      erb :'workouts/workouts'
    else
      redirect to '/login'
    end
  end

  get '/workouts/new' do
      if logged_in?
        erb :'workouts/create_workout'
      else
        redirect to '/login'
      end
    end
