class ReviewsController < ApplicationController
  before_filter :load_restaurant

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to @restaurant, notice: 'Review created successfully'
    else 
      render 'restaurant/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
