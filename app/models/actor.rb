class Actor < ApplicationRecord
    has_many :movie_actors
    has many :movies, through: :movie_actors
end
