class Movie < ApplicationRecord
    has_many :reviews
    belongs_to :director
    accepts_nested_attributes_for :director
    has_many :movie_actors
    has_many :actors, through: :movie_actors 
end
