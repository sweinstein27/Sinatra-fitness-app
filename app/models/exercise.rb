class Exercise < ActiveRecord::Base
  has_many :workouts
  has_many :users, through: :workouts


end
