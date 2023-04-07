# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'


10.times do

  Director.create!(
    name: Faker::Name.name,
    gender:Faker::Gender.binary_type
  )
end

10.times do

  director = Director.all.sample

  Movie.create!(
    title: Faker::Movie.title,
    year: Faker::Number.between(from: 1900, to: 2023),
    image: Faker::LoremFlickr.image(size: "300x400"),
    director: director
  )
end

comments = Faker::Lorem.sentence(word_count: 10)

30.times do

  movie = Movie.all.sample

  Review.create!(
    comments: comments,
    movie: movie
  )
end

