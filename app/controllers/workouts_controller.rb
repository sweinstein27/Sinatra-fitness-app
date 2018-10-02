class WorkoutsController < ApplicationController

  get '/workouts' do
    if logged_in?
      binding.pry
      @user = current_user
      if @workouts = Workout.all.find_by(id: @user.id)
        erb :'workouts/workouts'
      else
        redirect to 'workouts/new'
      end
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

  post '/workouts' do
   if logged_in?
     if params[:workout]== ""
       redirect to "/workouts/new"
     else
       @user = current_user
       binding.pry
       @workout = @user.workouts.create(name: params[:name], date: params[:date])
        redirect to "/users/#{@workout.user_id}"
      end
   else
     redirect to '/login'
   end
 end

 get '/workouts/:id' do
   if logged_in?
     @workout = Workout.find_by_id(params[:id])
     @exercises = @workout.exercises
     erb :'workouts/show_workout'
   else
     redirect to '/login'
   end
 end

 get '/workouts/:id/edit' do
    if logged_in?
      @workout = Workout.find_by_id(params[:id])
      if @workout && @workout.user == current_user
        erb :'workouts/edit_workout'
      else
        redirect to '/workouts'
      end
    else
      redirect to '/login'
    end
  end

  patch '/workouts/:id' do
     if logged_in?
       if params[:content] == ""
         redirect to "/workouts/#{params[:id]}/edit"
       else
         @workout = Workout.find_by_id(params[:id])
         if @workout && @workout.user == current_user
           if @workout.update(workout: params[:workout])
             redirect to "/workouts/#{@workout.id}"
           else
             redirect to "/workouts/#{@workout.id}/edit"
           end
         else
           redirect to '/workouts'
         end
       end
     else
       redirect to '/login'
     end
   end

   delete '/workouts/:id/delete' do
       if logged_in?
         @workout = Workout.find_by_id(params[:id])
         if @workout && @workout.user == current_user
           @workout.delete
         end
         redirect to '/workouts'
       else
         redirect to '/login'
       end
     end

    get '/workouts/:id/exercises/new' do
      @workout = Workout.find_by_id(params[:id])
      erb :'exercises/add_exercises'
    end

    # post '/workouts/:id/exercises' do
    #   binding.pry
    #    @workout = Workout.find_by_id(params[:id])
    #    @exercises = @workout.exercises
    #    @exercise = @workout.exercises.create(params)
    #
    #    erb :'/workouts/show_workout'
    #  end

     patch '/workouts/:id/exercises' do
       binding.pry
        @workout = Workout.find_by_id(params[:id])
        @exercises = @workout.exercises
        @exercise = @workout.exercises.create(params)

        erb :'/workouts/show_workout'
      end



   end
