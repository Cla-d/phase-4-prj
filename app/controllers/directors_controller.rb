class DirectorsController < ApplicationController
    def index
        @directors = Director.all
        render json: @directors
    end

    def show
        @director = Director.find_by(id: params[:id])
        if @director
            render json: @director
        else
            render json: {error: "Director not found"}, status: :not_found
        end
    end

    def create
        @directors =Director.find_by(id: params[:id])
        if @director=nill?
            director=director.new(director_params)
            if @director.save
                render json: @director, status: :created
            else 
                render json: @director.errors, status: :unprocessable_entity
            end
        else 
            render json: {error: "Director already exists"}, status: :conflict
        end
    end
    
    def update
        @directors = Director.find_by(id: params[:id])
        if @director.update(movie_params)
            @directors = director
        else
            render json: @director.errors, status: :unprocessable_entity
        end
    end
    
end
