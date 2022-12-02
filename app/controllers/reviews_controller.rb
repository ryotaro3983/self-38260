class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to content_path(params[:content_id])
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment).merge(user_id: current_user.id, content_id: params[:content_id])
  end
end
