class ReviewsController < ApplicationController
  before_filter :load_restaurant

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant.id), notice: 'Review added.' }
        # format.js {} # This will look for app/views/reviews/create.js.erb
        format.json { render json: @review, include: :user}
      else
        format.html { render 'restaurants/show', alert: 'There was an error.'  }
        # format.js {} # This will look for app/views/reviews/create.js.erb
      end
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
