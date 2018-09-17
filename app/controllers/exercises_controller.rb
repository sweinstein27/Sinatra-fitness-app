class ExercisesController < ApplicationController

  get '/exercises' do
    if logged_in?
      @user = current_user
      @exercises = Exercise.all
      erb :'exercises/exercises'
    else
      redirect to '/login'
    end
  end

  get '/exercises/new' do
      if logged_in?
        erb :'exercises/create_exercise'
      else
        redirect to '/login'
      end
    end

  post '/exercises' do
   if logged_in?
     if params[:exercise]== ""
       redirect to "/exercises/new"
     else
       @exercise = current_user.exercises.create(exercise: params[:exercise], sets: params[:sets], weight: params[:weight])
        redirect to "/exercises/#{@exercise.id}"
      end
   else
     redirect to '/login'
   end
 end

 get '/exercises/:id' do
   if logged_in?
     @exercise = Exercise.find_by_id(params[:id])
     erb :'exercises/show_exercise'
   else
     redirect to '/login'
   end
 end

 get '/exercises/:id/edit' do
    if logged_in?
      @exercise = Exercise.find_by_id(params[:id])
      if @exercise && @exercise.user == current_user
        erb :'exercises/edit_exercise'
      else
        redirect to '/exercises'
      end
    else
      redirect to '/login'
    end
  end

  patch '/exercises/:id' do
     if logged_in?
       if params[:content] == ""
         redirect to "/exercises/#{params[:id]}/edit"
       else
         @exercise = Exercise.find_by_id(params[:id])
         if @exercise && @exercise.user == current_user
           if @exercise.update(exercise: params[:exercise])
             redirect to "/exercises/#{@exercise.id}"
           else
             redirect to "/exercises/#{@exercise.id}/edit"
           end
         else
           redirect to '/exercises'
         end
       end
     else
       redirect to '/login'
     end
   end

   delete '/exercises/:id/delete' do
       if logged_in?
         @exercise = Exercise.find_by_id(params[:id])
         if @exercise && @exercise.user == current_user
           @exercise.delete
         end
         redirect to '/exercises'
       else
         redirect to '/login'
       end
     end
   end
