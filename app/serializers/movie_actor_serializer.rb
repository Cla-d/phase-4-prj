class MovieActorSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :image, :actor
  has_many :actors through: :movie_actors
end
