class ActorsController < ApplicationController

    def index
        @actors = Actor.all
        render json: @actors
    end

    def show
        @actor = Actor.find_by(id: params[:id])
        if @actor
            render json: @actor
        else
            render json: {error: "Actor not found"}, status: :not_found
        end
    end

    def create
        @actor = Actor.find_by(id: params[:id])
        if @actor = nill?
            actor = actor.new(actor_params)
            if @actor.save
                render json: @actor, status: :created
            else
                render json: actor.errors, status: :unprocessable_entity
            end
        else
            render json: {error: "Actor already exists"}, status: :conflict
        end
    end

    def update
        @actor = Actor.find_by(id: params[:id])
        if @actor.update(actor_params)
            render json: @actor
        else 
            render json: {error: "Actor not found"}, status: :not_found
        end
    end

    def destroy
        @actor = Actor.find_by(id: params[:id])
        if @actor = nill?
            render json: {error: "Actor not found"}, status: :not_found
        else
            @actor.destroy
            render json: {success: "Movie successfully deleted"}
        end
    end

    private

    def actor_params
        params.permit(:name, :gender)
    end
end
