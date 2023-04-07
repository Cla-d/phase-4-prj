class ReviewsController < ApplicationController

    def index
        @reviews = Review.all
        render json: @reviews
    end

    def show
        @review = Review.find_by(id: params[:id])
        if @review
            render json: @review
        else
            render json: {error: "Review not found"}, status: :not_found
        end
    end

    def create
        @review = Review.find_by(id: params[:id])
        if @review = nil?
            review=review.new(review_params)
            if @review.save
                render json: @review, status: :created
            else
                render json: @reviews.errors, status: :unprocessable_entity
            end
        else @review
            render json: {error: "Review already exists"}, status: :conflict
        end
    end

    def update
        @review = Review.find_by(id: params[:id])
        if @review.update(review_params)
            render json: @review
        else 
            render json: review.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @review = Review.find_by(id: params[:id])
        if @review
            @review.destroy(review_params)
            render json: { success: "Review successfully deleted"}
        else @review = nil?
            render json: {error: "Review not found"}, status: :not_found
        end
    end

    private
    
    def review_params
        params.require(:review).permit(:comments, movie_attributes: [:title, :year, :image]) 
    end
end
