class WorkoutsController < ApplicationController

  get '/workouts' do
    if logged_in?
      @user = current_user
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

  post '/workouts' do
   if logged_in?
     if params[:exercise]= ""
       redirect to "/workouts/new"
     else
       @workout = current_user.workouts.create(exercise: params[:exercise], sets: params[:sets], weight: params[:weight])
        redirect to "/workouts/#{@workout.id}"
      end
   else
     redirect to '/login'
   end
 end

 get '/workouts/:id' do
   if logged_in?
     @workout = Workout.find_by_id(params[:id])
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
           if @workout.update(exercise: params[:exercise])
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
   end
