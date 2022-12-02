class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :destroy]

  def create
    @review = Review.new(review_params)
    return unless @review.save

    redirect_to content_path(params[:content_id])
  end

  def edit
    @content = Content.find(params[:content_id])
    @review = Review.find(params[:id])
  end

  def update
    @content = Content.find(params[:content_id])
    @review = Review.find(params[:id])
    return unless @review.update(review_params)

    redirect_to content_path(params[:content_id])
  end

  def destroy
    content = Content.find(params[:content_id])
    review = Review.find(params[:id])
    review.destroy
    redirect_to content_path(params[:content_id])
  end

  private

  def review_params
    params.require(:review).permit(:comment).merge(user_id: current_user.id, content_id: params[:content_id])
  end
end
