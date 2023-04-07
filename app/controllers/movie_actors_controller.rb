class MovieActorsController < ApplicationController
    def create
        @movie = Movie.find_by(id: params[:movie_id])
        @actor = Actor.find_by(id: params[:actor_id])
        if @movie && @actor
          @movie_actor = MovieActor.new(movie_actor_params)
          @movie_actor.movie = @movie
          @movie_actor.actor = @actor
          if @movie_actor.save
            render json: @movie, serializer: MovieActor
          else
            render json: { errors: @movie_actor.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: "Movie or Actor not found" }, status: :not_found
        end
      end
    
      private
    
      def movie_actor_params
        params.require(:movie_actor)
      end
end
