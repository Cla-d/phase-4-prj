class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        render json: @movies
    end

    def show
        @movie = Movie.find_by(id: params[:id])
        if @movie 
            render json: @movie
        else
            render json: {error: "Movie not found"}, status: :not_found
        end
    end

    def create
        @movie =Movie.find_by(id: params[:id])
        if @movie=nill?
            movie=movie.new(movie_params)
            if @movie.save
                render json: @movie, status: :created
            else 
                render json: @movie.errors, status: :unprocessable_entity
            end
        else 
            render json: {error: "Movie already exists"}, status: :conflict
        end
    end
    
    def update
        @movie = Movie.find_by(id: params[:id])
        if @movie.update(movie_params)
            @movies = movie
        else
            render json: @movie.errors, status: :unprocessable_entity
    end
    end

    def destroy
        @movies = Movie.find_by(id: params[:id])
        if @movie.nil?
            render json: {error: "Movie does not exist"}
        else
            @movie.destroy
            render json: {success: "Movie successfully deleted"}
        end
    end

    private

    def movie_params
        params.require(:movie).permit(:title, :year, :image, director_attributes: [:name, :gender])
    end

end
