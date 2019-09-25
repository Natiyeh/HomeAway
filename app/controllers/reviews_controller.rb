class ReviewsController < ApplicationController
  def new
    @home = Home.find(params[:home_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @home = Home.find(params[:home_id])
    @review.home = @home
    @review.save
    redirect_to home_path(@home)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
