class Movie < ApplicationRecord
    has_many :reviews
    belongs_to :director
    has_many :movie_actors
    has_many :actors, through: :movie_actors 
end
